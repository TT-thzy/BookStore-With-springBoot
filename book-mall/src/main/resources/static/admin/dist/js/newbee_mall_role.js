$(function () {
    $("#jqGrid").jqGrid({
        url: '/admin/role/list',
        datatype: "json",
        colModel: [
            {label: '角色编号', name: 'id', index: 'id', width: 60, key: true},
            {label: '角色名称', name: 'name', index: 'name', width: 120}
        ],
        height: 760,
        rowNum: 20,
        rowList: [20, 50, 80],
        styleUI: 'Bootstrap',
        loadtext: '信息读取中...',
        rownumbers: false,
        rownumWidth: 20,
        autowidth: true,
        multiselect: true,
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

});

/**
 * jqGrid重新加载
 */
function reload() {
    initFlatPickr();
    var page = $("#jqGrid").jqGrid('getGridParam', 'page');
    $("#jqGrid").jqGrid('setGridParam', {
        page: page
    }).trigger("reloadGrid");
}

/**
 * 添加角色
 */
function addRole() {
    window.location.href = "/admin/role/edit";
}

/**
 * 修改角色
 */
function editRole() {
    var id = getSelectedRow();
    if (id == null) {
        return;
    }
    window.location.href = "/admin/role/edit/" + id;
}

/**
 * 撤回/删除角色
 */
function putRole() {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    swal({
        title: "确认弹框",
        text: "确认要执行上架操作吗?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "DELETE",
                    url: "/admin/role/remove",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("删除成功", {
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

function editRoleAdminUser(){
   let id =  getSelectedRow();
    window.location.href = '/admin/adminUser/' + id;
}

function editRoleMenu(){
    let id =  getSelectedRow();
    window.location.href = '/admin/menu?roleId=' + id;
}


$('#saveButton').click(function () {
    var id = $('#id').val();
    var name = $('#name').val();
    var isDeleted = $('#isDeleted').val();

    if (isNull(name)) {
        swal("请输入角色内容", {
            icon: "error",
        });
        return;
    }
    var url = '/admin/role/save';
    var swlMessage = '保存成功';
    var data = {
        "name": name,
        "isDeleted": isDeleted
    };
    if (id > 0) {
        url = '/admin/role/edit';
        swlMessage = '修改成功';
        data = {
            "id": id,
            "name": name,
            "isDeleted": isDeleted
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
                    confirmButtonText: '返回角色列表',
                    confirmButtonClass: 'btn btn-success',
                    buttonsStyling: false
                }).then(function () {
                    window.location.href = "/admin/role";
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

$('#cancelButton').click(function () {
    window.location.href = "/admin/role";
})