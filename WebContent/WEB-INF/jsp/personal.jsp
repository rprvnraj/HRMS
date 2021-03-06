<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:if test="${sessionScope['HRMSEmployeeId']==null}">
    <c:redirect url="index.html" />
</c:if>
<c:if test="${sessionScope['HRMSRole']=='Employee'}">
    <c:redirect url="employee_view.html?id=${HRMSEmployeeId}" />
</c:if>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Personal Details</title>
    <link href="images/logo1.png" rel="icon" />
    <c:import url="headCss.jsp" /> 
</head>

<body>
      <div class="containe">
        <div class="side-menu">
            <!-- Side Menu -->
            <c:import url="side-menu.jsp" /> </div>

        <div class="content-bar">
            <c:import url="top-menu.jsp" />

            <div class="content-main">
                <div class="col-md-12">
                    <!-- Main Start -->

                    <div id="Department-Table" role="tabpanel" class="tab-pane active">

                        <ol class="breadcrumb">
                            <li class="active">Personal Details</li>
                            <li><a href="javascript:void(0)">Communication Details</a>
                            </li>
                            <li><a href="javascript:void(0)">Education Details</a>
                            </li>
                            <li><a href="javascript:void(0)">Certification Details</a>
                            </li>
                            <li><a href="javascript:void(0)">Profile Picture</a>
                            </li>
                        </ol>

                        <div class="main-head">
                            <h1 class="title"> Personal Details </h1> </div>

                        <div class="form">
                            <c:if test="${Employee!=null}">
                                <spring:form method="post" class="personal-form" modelAttribute="Employee" action="employee_add" commandName="Employee">

                                    <div class="col-md-12">

                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-md-4 col-form-label">First Name</label>
                                                <div class="col-md-8">
                                                    <spring:input path="employeeFirstName" class="form-control" placeHolder="First Name" required="required" data-validation="length" data-validation-length="min5" data-validation-error-msg="Please Enter the Valid Name Minimum 5 Characters" />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-md-4 col-form-label">Last Name</label>
                                                <div class="col-md-8">
                                                    <spring:input path="employeeLastName" class="form-control" placeHolder="Last Name" required="required"   />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-md-4 col-form-label">Gender</label>
                                                <div class="col-md-8">
                                                    <div class="form-check">
                                                        <label class="form-check-label">
                                                            <spring:radiobutton class="form-check-input" path="employeeGender" value="Male" required="required" /> Male
                                                        </label>
                                                        <label class="form-check-label">
                                                            <spring:radiobutton class="form-check-input" path="employeeGender" value="Female" required="required" /> Female
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-md-4 col-form-label">Date of Birth</label>

                                                <div class="col-md-8">

                                                    <div class="input-group date form_date col-md-12" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                                        <input class="form-control readonly" size="16" value="" type="text"  placeHolder="Date of Birth" required="required"  />
                                                        <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                                    </div>
                                                    <spring:input path="employeeDateOfBirth" id="dtp_input2" type="hidden" class="form-control" placeHolder="Date of Birth" required="required" />
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-md-4 col-form-label">Marital Status</label>
                                                <div class="col-md-8">
                                                    <div class="form-check">
                                                        <label class="form-check-label">
                                                            <spring:radiobutton class="form-check-input" path="employeeMaritalStatus" value="Married" required="required" /> Married
                                                        </label>
                                                        <label class="form-check-label">
                                                            <spring:radiobutton class="form-check-input" path="employeeMaritalStatus" value="Unmarried" required="required" /> Unmarried
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-md-4 col-form-label">Date of Joining</label>
                                                <div class="col-md-8">
                                                    <div class="input-group date form_date col-md-12" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input3" data-link-format="yyyy-mm-dd">
                                                        <input class="form-control readonly" size="16" type="text"   required="required"  placeHolder="Date of Joining">
                                                        <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                                    </div>
                                                    <spring:input path="employeeDateOfJoining" id="dtp_input3" type="hidden" class="form-control" />
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-md-4 col-form-label">Department</label>
                                                <div class="col-md-8">
                                                    <select class="form-control" name="department" id="department" onchange="designationLoad();" required="required">
                                                        <option value=""> -- Select -- </option>
                                                        <c:forEach items="${DepartmentList}" var="department">
                                                            <option value="${department.departmentId}">${department.departmentName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-md-4 col-form-label">Designation</label>
                                                <div class="col-md-8">

                                                    <spring:select path="employeeDesignation.designationId" class="form-control" id="designationView" required="required">
                                                        <option value=""> Select Department -- </option>
                                                    </spring:select>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-md-4 col-form-label">Bank Account Number</label>
                                                <div class="col-md-8">
                                                    <spring:input path="employeeBankAccountNumber" class="form-control" data-validation="number" data-validation-error-msg="Enter valid Account number" placeHolder="Account Number" required="required" />
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-md-4 col-form-label">Basic Pay</label>
                                                <div class="col-md-8">
                                                    <spring:input path="employeeBasicPay" class="form-control" placeHolder="Basic Pay" required="required" data-validation="number" data-validation-allowing="float" data-validation-error-msg="Enter valid Basic Pay" />
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-md-4 col-form-label">Username</label>
                                                <div class="col-md-8">
                                                    <spring:input path="employeeUserName" id="userName" class="form-control" placeHolder="Username" onkeydown="userNameValid();"  onkeypress="userNameValid();" onchange="userNameValid();"  required="required" data-validation="length" data-validation-length="min6" data-validation-error-msg="Please Enter the Valid UserName Minimum 6 Characters" />
                                                </div>
                                             <div id="userNameValid"><input type="hidden" id="userNameValidInput" value="inCorrect" > </div>
                                                <div class="col-md-8 text-right" id="errorMessage" style="color:#F00;">  </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-md-4 col-form-label"> Password</label>
                                                <div class="col-md-8">
                                                    <spring:input path="employeePassword" class="form-control" type="password" placeHolder="Password" required="required" data-validation="length" data-validation-length="min5" data-validation-error-msg="Please Enter the Strong Password Minimum 5 Characters" />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-md-4 col-form-label">Role of the Employee</label>
                                                <div class="col-md-8">
                                                    <spring:select path="employeeRole.roleId" class="form-control" required="required">
                                                        <option value=""> -- Select -- </option>
                                                        <c:forEach items="${RoleList}" var="role">
                                                            <spring:option value="${role.roleId}">${role.roleName}</spring:option>
                                                        </c:forEach>
                                                    </spring:select>
                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="form-group row">
                                        <div class="col-md-12" align="center">
                                            <input class="btn btn-primary btn-lg" type="submit" value="Submit">
                                        </div>
                                    </div>
                                </spring:form>
                            </c:if>
                        </div>

                        <!-- Main End -->
                    </div>
                </div>
            </div>
        </div>
        </div>
         <c:import url="headJs.jsp" />
         <c:if test="${message!=null}">
            <script>
                $("#myModal").modal("hide");
                dialogConfirmation("personal.html");
            </script>
        </c:if>
        <c:import url="dialogConfirmation.jsp" />
<script>

</script>
</body>

</html>
