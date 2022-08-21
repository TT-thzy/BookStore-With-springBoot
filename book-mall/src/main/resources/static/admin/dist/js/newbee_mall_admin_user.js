$(function () {
   let roleId = $("#roleId").val();
    $("#jqGrid").jqGrid({
        url: '/admin/list?roleId=' + roleId,
        datatype: "json",
        colModel: [
            {label: 'id', name: 'adminUserId', index: 'adminUserId', width: 50, key: true, hidden: true},
            {label: '昵称', name: 'nickName', index: 'nickName', width: 180},
            {label: '登录名', name: 'loginUserName', index: 'loginUserName', width: 120},
            {label: '所属角色', name: 'roleName', index: 'roleName', width: 60}
        ],
        height: 560,
        rowNum: 10,
        rowList: [10, 20, 50],
        styleUI: 'Bootstrap',
        loadtext: '信息读取中...',
        rownumbers: false,
        rownumWidth: 20,
        autowidth: true,
        multiselect: true,
        viewrecords: true,
        pager: "#jqGridPager",
        jsonReader: {
            root: "data.list",
            page: "data.currPage",
            total: "data.totalPage",
            records: "data.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order",
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});

        }
    });

    $(window).resize(function () {
        $("#jqGrid").setGridWidth($(".card-body").width());
    });

    function lockedFormatter(cellvalue) {
        if (cellvalue == 1) {
            return "<button type=\"button\" class=\"btn btn-block btn-secondary btn-sm\" style=\"width: 50%;\">锁定</button>";
        } else if (cellvalue == 0) {
            return "<button type=\"button\" class=\"btn btn-block btn-success btn-sm\" style=\"width: 50%;\">正常</button>";
        }
    }

    function deletedFormatter(cellvalue) {
        if (cellvalue == 1) {
            return "<button type=\"button\" class=\"btn btn-block btn-secondary btn-sm\" style=\"width: 50%;\">注销</button>";
        } else if (cellvalue == 0) {
            return "<button type=\"button\" class=\"btn btn-block btn-success btn-sm\" style=\"width: 50%;\">正常</button>";
        }
    }
});

/**
 * jqGrid重新加载
 */
function reload() {
    var page = $("#jqGrid").jqGrid('getGridParam', 'page');
    $("#jqGrid").jqGrid('setGridParam', {
        page: page
    }).trigger("reloadGrid");
}

function addAdminUser() {
    reset();
    $('.modal-title').html('分配用户');
    $('#adminUserModal').modal('show');
}

function updateAdminUser(){
    reset();
    var id = getSelectedRow();
    if (id == null) {
        return;
    }
    var rowData = $("#jqGrid").jqGrid("getRowData", id);
    $('.modal-title').html('系统用户信息编辑');
    $('#adminUserModal').modal('show');
    $("#adminUserId").val(id);
    $("#loginUserName").val(rowData.loginUserName);
    $("#loginPassword").val(rowData.loginPassword);
    $("#nickName").val(rowData.nickName);
}

function removeAdminUser(lockStatus) {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    if (lockStatus != 0 && lockStatus != 1) {
        swal('非法操作', {
            icon: "error",
        });
    }
    swal({
        title: "确认弹框",
        text: "确认要移除用户吗?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/admin/remove",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("操作成功", {
                                icon: "success",
                            });
                            $("#jqGrid").trigger("reloadGrid");
                        } else {
                            swal(r.message, {
                                icon: "error",
                            });
                        }
                    }
                });
            }
        }
    )
    ;
}

$('#saveButton').click(function () {
    var adminUserId = getSelectedRow();
    var roleId = $('#roleId').val();
    var loginUserName = $('#loginUserName').val();
    var loginPassword = $('#loginPassword').val();
    var nickName = $('#nickName').val();

    if (isNull(loginUserName)) {
        swal("请输入用户名", {
            icon: "error",
        });
        return;
    } if (isNull(loginPassword)) {
        swal("请输入密码", {
            icon: "error",
        });
        return;
    } if (isNull(nickName)) {
        swal("请输入昵称", {
            icon: "error",
        });
        return;
    }
    var url = '/admin/save';
    var swlMessage = '保存成功';
    var data = {
        "loginUserName": loginUserName,
        "loginPassword": loginPassword,
        "nickName": nickName,
        "roleId": roleId
    };
    if (adminUserId > 0) {
        url = '/admin/edit';
        swlMessage = '修改成功';
        data = {
            "loginUserName": loginUserName,
            "loginPassword": loginPassword,
            "nickName": nickName,
            "roleId": roleId,
            "adminUserId": adminUserId
        };
    }
    console.log(data);
    $.ajax({
        type: 'POST',//方法类型
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (result) {
            if (result.resultCode == 200) {
                swal({
                    title: swlMessage,
                    type: 'success',
                    showCancelButton: false,
                    confirmButtonColor: '#1baeae',
                    confirmButtonText: '返回系统用户列表',
                    confirmButtonClass: 'btn btn-success',
                    buttonsStyling: false
                }).then(function () {
                    window.location.href = "/admin/adminUser/"+ roleId;
                })
            } else {
                swal(result.message, {
                    icon: "error",
                });
            }
            ;
        },
        error: function () {
            swal("操作失败", {
                icon: "error",
            });
        }
    });
});

function reset() {
    $("#loginUserName").val('');
    $("#loginPassword").val('');
    $("#nickName").val('');
    $('#edit-error-msg').css("display", "none");
}