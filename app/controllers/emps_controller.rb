class EmpsController < ApplicationController
  # GET /emps
  # GET /emps.xml
  def index
    @emps = Emp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emps }
      format.js do
        render :update do |page|
          page.call "$('#show').hide"
        end
      end
    end
  end

  # GET /emps/1
  # GET /emps/1.xml
  def show
    @emp = Emp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @emp }
      format.js do
        render :update do |page|
          page.call "$('#show').show"
          page.call "$('#show').html",render(:partial => 'show')
          #                    or
          #          page.call "$('#show').html",render('show')
        end
      end
    end
  end

  # GET /emps/new
  # GET /emps/new.xml
  def new
    @emp = Emp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @emp }
      format.js do
        render :update do |page|
          page.call "$('#new_form').show"
          page.call "$('#new_form').html", render(:partial => 'form', :object => @emp)
        end
      end
    end
  end

  # GET /emps/1/edit
  def edit
    @emp = Emp.find(params[:id])
    respond_to do |format|
      format.js do
        render :update do |page|
          page.call "$('#new_form').show"
          page.call "$('#new_form').html", render(:partial => 'form', :object => @emp)
          page.call "$('#show').hide"
        end
      end
    end
  end

  # POST /emps
  # POST /emps.xml
  def create
    @emp = Emp.new(params[:emp])

    respond_to do |format|
      if @emp.save
        format.html { redirect_to(@emp, :notice => 'Emp was successfully created.') }
        format.xml  { render :xml => @emp, :status => :created, :location => @emp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @emp.errors, :status => :unprocessable_entity }
      end
      format.js do
        @emps = Emp.all
        render :update do |page|
          page.call "$('#list').html", render(:partial => 'emp_list', :object => @emps)
          page.call "$('#new_form').hide"
        end
      end
    end
  end

  # PUT /emps/1
  # PUT /emps/1.xml
  def update
    @emp = Emp.find(params[:id])

    respond_to do |format|
      if @emp.update_attributes(params[:emp])
        format.html { redirect_to(@emp, :notice => 'Emp was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @emp.errors, :status => :unprocessable_entity }
      end
      format.js do
        @emps = Emp.all
        render :update do |page|
          page.call "$('#list').html", render(:partial => 'emp_list', :object => @emps)
          page.call "$('#new_form').hide"
        end
      end
    end
  end

  # DELETE /emps/1
  # DELETE /emps/1.xml
  def destroy
    @emp = Emp.find(params[:id])
    @emp.destroy

    respond_to do |format|
      format.html { redirect_to(emps_url) }
      format.xml  { head :ok }
      format.js do
        @emps = Emp.all
        render :update do |page|
          page.call "$('#list').html", render(:partial => 'emp_list', :object => @emps)
        end
      end

    end
  end

  def delete_all
    p @ids = params[:emp_ids]
    @ids.each do |id|
      @emp = Emp.find(id)
      @emp.destroy
    end
    respond_to do |format|
      format.js do
        @emps = Emp.all
        render :update do |page|
          page.call "$('#list').html", render(:partial => 'emp_list', :object => @emps)
        end
      end
    end
  end
end
