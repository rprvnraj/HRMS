<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Designation Details</title>
    <link href="images/logo1.png" rel="icon" />
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/sidebar-menu.css"> </head>

<body>
    <div id="dialog-confirm" title="Alert" style="display:none;">
        <p>
            <c:if test="${message!=null}">
                <c:out value="${message}" /></c:if>
        </p>
    </div>
    <div class="containe">
        <div class="side-menu">
            <!-- Side Menu -->
            <c:import url="side-menu.jsp" /> </div>

        <div class="content-bar">
            <c:import url="top-menu.jsp" />



            <div class="content-main">
                <div class="col-md-12">
                    <!-- Main Start -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#Department-Table" aria-controls="Department-Table" role="tab" data-toggle="tab">Designations</a>
                        </li>
                        <li role="presentation"><a href="#Department-Form" aria-controls="Department-Form" role="tab" data-toggle="tab">Add New</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="Department-Table" role="tabpanel" class="tab-pane active">
                            <div class="form">
                                <div class="main-head">
                                    <h1 class="title"> Designation Details </h1> </div>

                                <c:if test="${DesignationList!=null}">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Designation Name</th>
                                                <th>Department Name</th>
                                        </thead>
                                        <tfoot>

                                            <tr>
                                                <th colspan="7" class="ts-pager form-horizontal">
                                                    <button type="button" class="btn first"><i class="fa fa-fast-backward "></i>
                                                    </button>
                                                    <button type="button" class="btn prev"><i class="fa fa-step-backward "></i>
                                                    </button>
                                                    <span class="pagedisplay"></span>
                                                    <!-- this can be any element, including an input -->
                                                    <button type="button" class="btn next"><i class="fa fa-step-forward"></i>
                                                    </button>
                                                    <button type="button" class="btn last"><i class="fa fa-fast-forward"></i>
                                                    </button>
                                                    <select class="pagesize input-mini" title="Select page size">
                                                        <option selected="selected" value="10">10</option>
                                                        <option value="20">20</option>
                                                        <option value="30">30</option>
                                                        <option value="40">40</option>
                                                        <option value="50">50</option>
                                                    </select>
                                                    <select class="pagenum input-mini" title="Select page number"></select>
                                                </th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach var="designation" items="${DesignationList}">
                                                <tr>
                                                    <td>
                                                        <c:out value="${designation.designationId}"></c:out>
                                                    </td>
                                                    <td>
                                                        <c:out value="${designation.designationName}"></c:out>
                                                    </td>
                                                    <td>
                                                        <c:set value="${designation.department}" var="department" />
                                                        <c:out value="${department.departmentName}"></c:out>
                                                    </td>
                                                    <td>
                                                        <a href="designation_edit.html?id=<c:out value='${designation.designationId} ' />" class="edit"> <i class="fa fa-pencil"></i> Edit </a> &nbsp;&nbsp;
                                                        <a href="designation_delete.html?id=<c:out value='${designation.designationId} ' />" class="delete"> <i class="fa fa-trash"></i> Delete </a>

                                                    </td>

                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </c:if>




                            </div>
                        </div>
                        <div id="Department-Form" role="tabpanel" class="tab-pane">
                            <div class="form">
                                <div class="main-head">
                                    <h1 class="title"> Add New Designation </h1> </div>
                                <div class="single-rowform">
                                    <c:if test="${Designation!=null}">
                                        <spring:form action="designation_insert" method="post" class="form-group" modelAttribute="Designation">
                                            <div class="col-md-12">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label for="example-text-input" class="col-md-4 col-form-label">Designation Name</label>
                                                        <div class="col-md-8">
                                                            <spring:input path="designationName" class="form-control" id="example-text-input" placeHolder="Designation Name" /> </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="example-text-input" class="col-md-4 col-form-label">Department</label>
                                                        <div class="col-md-8">

                                                            <spring:select path="department" class="form-control">
                                                                <spring:option value="0"> --Select --</spring:option>
                                                                <c:forEach items="${DepartmentList}" var="department">
                                                                    <spring:option value="${department.departmentId}">${department.departmentName}</spring:option>
                                                                </c:forEach>
                                                            </spring:select>
                                                        </div>

                                                        <div class="col-md-12">
                                                            <br/> </div>
                                                        <div class="form-group row" align="center">
                                                            <div class="col-md-12">
                                                                <input class="btn btn-primary btn-lg" type="submit" id="example-text-input" value="Save"> </div>
                                                        </div>



                                                    </div>



                                                </div>
                                            </div>
                                        </spring:form>
                                    </c:if>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- Main End -->
                </div>
            </div>
        </div>
    </div>
    <div id="myModal" class="modal fade" role="dialog" aria-hidden="false" data-backdrop="static">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Edit Designation</h4>
                </div>
                <div class="modal-body">
                    <c:if test="${DesignationEdit!=null}">
                        <spring:form action="designation_update" method="post" class="form-group" modelAttribute="DesignationEdit">
                            <div class="col-md-12">

                                <spring:input path="designationId" type="hidden" class="form-control" id="example-text-input" placeHolder="Designation Id" readonly="readOnly" /> </div>
                            <div class="form-group row">
                                <label for="example-text-input" class="col-md-4 col-form-label">Designation Name</label>
                                <div class="col-md-8">
                                    <spring:input path="designationName" class="form-control" id="example-text-input" placeHolder="Designation Name" /> </div>
                            </div>




                            <div class="form-group row">
                                <label for="example-text-input" class="col-md-4 col-form-label">Department</label>
                                <div class="col-md-8">
                                    <spring:select path="department" class="form-control">
                                        <c:set value="${DesignationEdit.department}" var="dep" />
                                        <spring:option value="${dep.departmentId}">${dep.departmentName}</spring:option>
                                        <spring:option value="0"> -------</spring:option>
                                        <c:forEach items="${DepartmentList}" var="department">
                                            <spring:option value="${department.departmentId}">${department.departmentName}</spring:option>
                                        </c:forEach>
                                    </spring:select>
                                </div>
                            </div>
                            <div class="form-group row" align="center">
                                <div class="col-md-12">
                                    <input class="btn btn-primary btn-lg" type="submit" id="example-text-input" value="Save"> </div>
                            </div>
                </div>
                </spring:form>
                </c:if>
            </div>
            <div class="modal-footer"> </div>
        </div>

    </div>
    </div>



    <link rel="stylesheet" href="css/jquery-ui.css" />
    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/sidebar-menu.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/bootstrap.js"></script>


    <!-- Tablesorter: required for bootstrap -->
    <link rel="stylesheet" href="css/theme.bootstrap.css">
    <script src="js/jquery.tablesorter.js"></script>
    <script src="js/jquery.tablesorter.widgets.js"></script>

    <!-- Tablesorter: optional -->
    <link rel="stylesheet" href="css/jquery.tablesorter.pager.css">
    <script src="js/jquery.tablesorter.pager.js"></script>

    <script id="js">
        $(function() {
            $.tablesorter.themes.bootstrap = {
                table: 'table table-bordered table-striped',
                caption: 'caption',
                header: 'bootstrap-header',
                sortNone: '',
                sortAsc: '',
                sortDesc: '',
                active: '',
                hover: '',
                icons: '',
                iconSortNone: 'fa fa-sort',
                iconSortAsc: 'fa fa-sort-asc',
                iconSortDesc: 'fa fa-sort-desc ',
                filterRow: '',
                footerRow: '',
                footerCells: '',
                even: '',
                odd: ''
            };


            $("table").tablesorter({
                    theme: "bootstrap",

                    widthFixed: true,

                    headerTemplate: '{content} {icon}',

                    widgets: ["uitheme", "filter", "zebra"],

                    widgetOptions: {
                        zebra: ["even", "odd"],

                        filter_reset: ".reset",

                        filter_cssFilter: "form-control",


                    }
                })
                .tablesorterPager({

                    container: $(".ts-pager"),
                    cssGoto: ".pagenum",
                    removeRows: false,
                    output: '{startRow} - {endRow} / {filteredRows} ({totalRows})'

                });

        });
    </script>

    <script>
        $.sidebarMenu($('.sidebar-menu'));
    </script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $('#tabs').tab();
        });
    </script>

    <c:if test="${message==null}">
        <c:if test="${DesignationEdit!=null}">
            <script>
                $("#myModal").modal();
            </script>
        </c:if>
    </c:if>

    <c:if test="${message!=null}">
        <script>
            $("#myModal").modal("hide");
            $(function() {
                $("#dialog-confirm").dialog({
                    modal: true,
                    open: function(event, ui) {
                        $(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
                    },
                    buttons: {
                        Ok: function() {
                            $(this).dialog("close");
                            window.location = "designation.html";
                        }
                    }
                });
            });
        </script>
    </c:if>
</body>

</html>           