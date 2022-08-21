$(function () {
   let roleId =  $("#roleId").val();
    console.log(roleId);
    let url = "/admin/menu/list";
    if(roleId){
        url += "?roleId="+roleId;
    }
    $("#jqGrid").jqGrid({
        url: url,
        datatype: "json",
        colModel: [
            {label: '菜单编号', name: 'id', index: 'id', width: 60, key: true},
            {label: '菜单名称', name: 'menuName', index: 'menuName', width: 120},
            {label: '菜单路径', name: 'menuPath', index: 'menuPath', width: 120},
            {label: '父菜单名称', name: 'parentName', index: 'parentName', width: 120},
            {label: '创建时间', name: 'releaseTime', index: 'releaseTime', width: 120}
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
 * 添加菜单
 */
function addMenu() {
    window.location.href = "/admin/menu/edit";
}

/**
 * 修改菜单
 */
function editMenu() {
    var id = getSelectedRow();
    if (id == null) {
        return;
    }
    window.location.href = "/admin/menu/edit/" + id;
}

/**
 * 撤回/删除菜单
 */
function putMenu() {
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
                    url: "/admin/menu/remove",
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

$('#saveButton').click(function () {
    var id = $('#id').val();
    var menuName = $('#menuName').val();
    var menuPath = $('#menuPath').val();
    var isDeleted = $('#isDeleted').val();
    var parentId = $('#parentId').val();

    if (isNull(menuName)) {
        swal("请输入菜单名称", {
            icon: "error",
        });
        return;
    }
    if (isNull(menuPath)) {
        swal("请输入菜单路径", {
            icon: "error",
        });
        return;
    }
    if (isNull(menuName)) {
        parentId = 0;
    }
    var url = '/admin/menu/save';
    var swlMessage = '保存成功';
    var data = {
        "menuName": menuName,
        "menuPath": menuPath,
        "parentId": parentId,
        "isDeleted": isDeleted
    };
    if (id > 0) {
        url = '/admin/menu/edit';
        swlMessage = '修改成功';
        data = {
            "id": id,
            "menuName": menuName,
            "menuPath": menuPath,
            "parentId": parentId,
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
                    confirmButtonText: '返回菜单列表',
                    confirmButtonClass: 'btn btn-success',
                    buttonsStyling: false
                }).then(function () {
                    window.location.href = "/admin/menu";
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
    window.location.href = "/admin/menu";
})