$(function () {
    let re = $("#reply").val();
    let url;
    if(re){
        url = '/admin/message/list?reply='+re;
    }else{
        url = '/admin/message/list';
    }
    $("#jqGrid").jqGrid({
        url: url,
        datatype: "json",
        colModel: [
            {label: '留言编号', name: 'id', index: 'id', width: 60, key: true},
            {label: '留言内容', name: 'msg', index: 'msg', width: 120},
            {label: '发布人', name: 'nickName', index: 'nickName', width: 60},
            {label: '留言时间', name: 'releaseTime', index: 'releaseTime', width: 60}
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
 * 撤回/删除留言
 */
function putMessage() {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    swal({
        title: "确认弹框",
        text: "确认要删除留言吗?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "DELETE",
                    url: "/admin/message/remove",
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

function replyMessage() {
    var id = getSelectedRow();
    window.location.href = '/admin/message/edit?parentId=' + id;
}

function showReplyMessage(){
    window.location.href = '/admin/message/reply';
}

$('#saveButton').click(function () {
    var id = $('#id').val();
    var msg = $('#msg').val();
    var isDeleted = $('#isDeleted').val();
    var parentId = $('#parentId').val();

    if (isNull(msg)) {
        swal("请输入回复内容", {
            icon: "error",
        });
        return;
    }
    var url = '/admin/message/save';
    var swlMessage = '保存成功';
    var data = {
        "msg": msg,
        "parentId":parentId,
        "isDeleted":isDeleted
    };
    if (id > 0) {
        url = '/admin/message/edit';
        swlMessage = '修改成功';
        data = {
            "id": id,
            "msg": msg,
            "parentId":parentId,
            "isDeleted":isDeleted
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
                    confirmButtonText: '返回留言列表',
                    confirmButtonClass: 'btn btn-success',
                    buttonsStyling: false
                }).then(function () {
                    window.location.href = "/admin/message";
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
    window.location.href = "/admin/message";
})