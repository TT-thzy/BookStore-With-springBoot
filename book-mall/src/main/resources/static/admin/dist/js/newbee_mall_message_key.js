$(function () {
    $("#jqGrid").jqGrid({
        url: '/admin/message/key/list',
        datatype: "json",
        colModel: [
            {label: '屏蔽词编号', name: 'id', index: 'id', width: 60, key: true},
            {label: '屏蔽词', name: 'key', index: 'key', width: 120},
            {label: '添加时间', name: 'releaseTime', index: 'releaseTime', width: 60}
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
 * 添加屏蔽词
 */
function addMessageKey() {
    window.location.href = "/admin/message/key/edit";
}

/**
 * 修改屏蔽词
 */
function editMessageKey() {
    var id = getSelectedRow();
    if (id == null) {
        return;
    }
    window.location.href = "/admin/message/key/edit/" + id;
}

/**
 * 撤回/删除屏蔽词
 */
function putMessageKey() {
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
                    url: "/admin/message/key/remove",
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
    var key = $('#key').val();
    var isDeleted = $('#isDeleted').val();

    if (isNull(key)) {
        swal("请输入屏蔽词内容", {
            icon: "error",
        });
        return;
    }
    var url = '/admin/message/key/save';
    var swlMessage = '保存成功';
    var data = {
        "key": key,
        "isDeleted": isDeleted
    };
    if (id > 0) {
        url = '/admin/message/key/edit';
        swlMessage = '修改成功';
        data = {
            "id": id,
            "key": key,
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
                    confirmButtonText: '返回屏蔽词列表',
                    confirmButtonClass: 'btn btn-success',
                    buttonsStyling: false
                }).then(function () {
                    window.location.href = "/admin/message/key";
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
    window.location.href = "/admin/message/key";
})



