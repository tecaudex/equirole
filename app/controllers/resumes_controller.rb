class ResumesController < ApplicationController
  before_action :authorize_page
  skip_before_action :authorize_page, only: [:index]

  def index
    if current_user.admin?
      @pending_resumes = Resume.where(status: 'pending')
      @approved_resumes = Resume.where(status: 'approved')
    else
      @resumes = current_user.resumes
    end
    # @resumes = Resume.paginate(page: params[:page], per_page: 5)
  end

  def new
    @resume = Resume.new
  end

  def create
    resume = params["resume"]
    role = resume["role"]
    doc = resume["document"]
    # links = email = address = []
    data = ""
    email = []
    address = []
    links = []
    phone_num = ""
    edu_ind = exp_ind = 0

    File.open(doc, "rb") do |io|
      reader = PDF::Reader.new(io)
      puts reader.info
      reader.pages.each do |page|
        data =  data + page.text
      end
    end

    data_arr = data.split("\n\n")  #data split into array
    data_arr = data_arr.map{|n| n.squeeze(" ")}  #unnecessary spaces removes
    web_links = URI.extract(data) #get links from resume
    web_links.each do |link|
      links.push(link) if link.include?('.com')
    end

    data_arr.each_with_index do |str, ind|
      email.push(str.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i).first)
      if(str.include?("Street") || str.include?("St") || str.include?("st")) && str=~ /\d/
        address.push(str.tr("\n",""))
      end
      phone_num = str.gsub(/[^0-9]/, '') if str.gsub(/[^0-9]/, '').length == 10
      edu_ind = ind if str.tr("\n","").start_with?('EDUCATION', 'education')
      exp_ind = ind if str.tr("\n","").start_with?('EXPERIENCE', 'experience')
    end

    resume = Resume.create(full_name: data_arr[0].strip, address: address.first, email: email.reject(&:nil?).first, phone_number: phone_num, weblinks: links.join(','), created_at: DateTime.current, user_id: current_user.id, role_id: role, raw_data: data)

    # s.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i).first  for email
    # s.gsub(/[^0-9]/, '') for contact number
    # tr("\n","") remove \n

    flash[:success] = 'Successfully Submitted for Approval!'
    redirect_to root_path
  end

  def destroy
    @resume = Resume.find params['id']
    @resume.delete
    flash[:success] = 'Successfully Deleted!'
    redirect_to root_path
  end

  def approve
    @resume = Resume.find params['id']
    @resume.update(status: 'approved')
    flash[:success] = 'Successfully Approved!'
    redirect_to root_path
  end

  def generate_pdf
    @resume = Resume.find params['id']
    @data = @resume.raw_data.squeeze(" ").split("\n\n")

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Resume_#{@resume.id}",
               page_size: 'a4',
               template: 'resumes/pdf_resume.html.erb',
               layout: 'pdf.html',
               lowquality: true,
               zoom: 1,
               dpi: 75
      end
    end
  end

end
