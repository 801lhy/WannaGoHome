<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<div class="container sub_bg">
    <script>

    $(function() {
        $('.jq_elips2').ellipsis( {row : 2,  onlyFullWords: true} );
        $('.jq_elips').ellipsis();
    });
</script>
<div id="contents_area" class="col-xs-9">
<script>
var curFFstatus = 'follow';
function checkFollowLogin()
{
    return  true; }

function viewFriendList(follow)
{
    if(!checkFollowLogin()) return ;
    $("#viewFriendModal").modal('show');
    getListFriend(1, follow);
}

function doActFriend(uid,idx, objs, objs2)
{
    if(!checkFollowLogin()) return ;
    if(!objs) objs = 'btnActFriend_';
    if(!objs2) objs2 = 'folFriend_';
    var act = $("#"+objs+idx).attr("fact");
    var mode = (act == "insert") ? "addFriend" : "removeFriend";
    $.ajax({
        type: "GET",
        url: "/profile/ajax.html",
        data: "q_mode="+mode+"&friend="+uid,
        success: function(result) {
            if(result == 'SUCCESS')
            {
                var fact = (act == "insert") ? "delete" : "insert";
                var fval = (act == "insert") ? "����" : "�߰�";
                var msg = (act == 'insert') ? '���� �ҽĹޱ⿡ �߰��߽��ϴ�.' : '���� �ҽĹޱ⿡�� �����߽��ϴ�.';
                $("#"+objs+idx).attr("fact", fact);
                if(idx > 0)
                {
                    $("#"+objs+idx).html(fval);
                                        if(act == "delete" && curFFstatus == "following" && objs2) $("#"+objs2+idx).hide();
                                        var uname = $("#"+objs2+idx).text().replace($("#"+objs+idx).text(),'');
                }
                else
                {
                    if(act == "insert") $("#btnActFriend_0").html('<span class="glyphicon glyphicon-minus"></span>�ҽĲ���');
                    else $("#btnActFriend_0").html('<span class="glyphicon glyphicon-plus"></span>�ҽĹޱ�');

                    var uname = "cloudsky";
                }
                ga('send', 'event', '�̿��߰�', fval, uname);

                alert(uname+msg);
            }
            else
            {
                alert('ó������. ����� �ٽ� �õ��� �ּ���.');
            }
        }
    });
}

function getListFriend(page, follow)
{
    $.ajax({
        type: "GET",
        url: "/profile/ajax.html",
        data: "q_mode=getListFriend&page="+page+"&follow="+follow+"&uid=",
        success: function(result) {
            if(result)
            {
                var titleMsg = (follow == "follower") ? "���� ������ ģ��" : "���� ģ��";
                $("#friendModalTitle").html("cloudsky"+titleMsg);
                $("#friendModalList_"+page).html(result);
                curFFstatus = follow;
            }
            else
            {
                alert('��ȸ����. ����� �ٽ� �õ��� �ּ���.');
            }
        }
    });
}

function doProfileImageSubmit()
{
        if(!$("#newProfileUrl").val() && !$("input[name=self_intro]").val())
    {
        alert('�� ������ �̹����� �÷��ּ���.');
        return ;
    }

    $.ajax({
        type: "POST",
        url: "/profile/ajax.html",
        data: "q_mode=changeProfileImage&profile="+$("#newProfileUrl").val()+"&self_intro="+$("input[name=self_intro]").val(),
        success: function(result) {
            if(result=="SUCCESS")
            {
                self.location.reload();
            }
            else if(result=="NO_PARAM")
            {
                alert('�Ķ���Ϳ���. �ٽ� Ȯ���� �ּ���.');
            }
            else if(result=="FILE_ERROR")
            {
                alert('���� ���ε忡 ������ �߻��߽��ϴ�. �ٽ� Ȯ���� �ּ���.');
            }
            else
            {
                alert('�������. ����� �ٽ� �õ��� �ּ���.');
            }
        }
    });
}

function doDeleteIntro()
{
        if(confirm('�ڱ�Ұ��� �����ұ��?'))
    {
        $.ajax({
            type: "GET",
            url: "/profile/ajax.html",
            data: "q_mode=deleteIntro",
            success: function(result) {
                if(result=="SUCCESS")
                {
                    self.location.reload();
                }
                else
                {
                    alert('�������. ����� �ٽ� �õ��� �ּ���.');
                }
            }
        });
    }
}

function doBgImageSubmit()
{
        if(!$("#newBgUrl").val())
    {
        alert('�� ��� �̹����� �÷��ּ���.');
        return ;
    }

    $.ajax({
        type: "POST",
        url: "/profile/ajax.html",
        data: "q_mode=changeBgImage&profile="+$("#newBgUrl").val(),
        success: function(result) {
            if(result=="SUCCESS")
            {
                self.location.reload();
            }
            else if(result=="NO_PARAM")
            {
                alert('�Ķ���Ϳ���. �ٽ� Ȯ���� �ּ���.');
            }
            else if(result=="FILE_ERROR")
            {
                alert('���� ���ε忡 ������ �߻��߽��ϴ�. �ٽ� Ȯ���� �ּ���.');
            }
            else
            {
                alert('�������. ����� �ٽ� �õ��� �ּ���.');
            }
        }
    });
}

function handlePhotoFiles(e){
    var file_gubun = '';
    var str_num = '';

    if (e.target.files[0].size > (2*1024*1024)) {
        alert("������ 2MB������ ���˴ϴ�.");
        return false;
    }

    $('#submit_btn').attr('type','button').attr('onClick','alert("������ �ø��� ���Դϴ�.");');

    var reader = new FileReader;
    reader.onload = function(evt) {
        var img = new Image();
        img.src = reader.result;
        img.onload = function () {
            var finalFile = reader.result;
            $.ajax({
                beforeSend: function(xhr){
                    xhr.setRequestHeader('Content-Type', 'canvas/upload');
                },
                type: "POST",
                url: "/util/upload_mobile.html",
                data: "canvasData="+finalFile,
                dataType: "json",
                cache: "false",
                processData: false,
                success: function(json) {
                    if(json['result'] == "SUCCESS") {
                        $('#profileSubmitBtn').prop('disabled',false);
                        $("#vProfileImageModalSrc").attr("src",json['url']);
                        $("#newProfileUrl").val(json['url']);
                    } else {
                        alert("ó���� �����Ͽ����ϴ�.");
                    }
                },
                error: function (request,status,error) {
                    //alert('������ �߻��Ͽ����ϴ�.');
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
        }
    }
    reader.readAsDataURL(e.target.files[0]);
}

function handleBgFiles(e){
    var file_gubun = '';
    var str_num = '';

    if (e.target.files[0].size > (2*1024*1024)) {
        alert("������ 2MB������ ���˴ϴ�.");
        return false;
    }

    $('#submit_btn').attr('type','button').attr('onClick','alert("������ �ø��� ���Դϴ�.");');

    var reader = new FileReader;
    reader.onload = function(evt) {
        var img = new Image();
        img.src = reader.result;
        img.onload = function () {
            var finalFile = reader.result;
            $.ajax({
                beforeSend: function(xhr){
                    xhr.setRequestHeader('Content-Type', 'canvas/upload');
                },
                type: "POST",
                url: "/util/upload_mobile.html",
                data: "canvasData="+finalFile,
                dataType: "json",
                cache: "false",
                processData: false,
                success: function(json) {
                    if(json['result'] == "SUCCESS") {
                        $('#bgSubmitBtn').prop('disabled',false);
                        $("#vBgImageModalSrc").attr("src",json['url']);
                        $("#newBgUrl").val(json['url']);
                    } else {
                        alert("ó���� �����Ͽ����ϴ�.");
                    }
                },
                error: function (request,status,error) {
                    //alert('������ �߻��Ͽ����ϴ�.');
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
        }
    }
    reader.readAsDataURL(e.target.files[0]);
}

$(document).ready(function()
{
	    $("#file_1").change(function(e) {
        handlePhotoFiles(e);
    });

    $("input[name=self_intro]").change(function(e) {
        $('#profileSubmitBtn').prop('disabled',false);
    });
});
</script>
<div id="viewFriendModal" class="modal" role="dialog" aria-hidden="true">
  <div class="modal-dialog" style="width:370px">
    <div class="modal-content" style="padding:0;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><img src="http://recipe1.ezmember.co.kr/img/btn_close.gif" alt="�ݱ�"></span></button>
        <h4 class="modal-title" id="friendModalTitle"></h4>
      </div>
      <div class="modal-body" style="padding:0;">
        <ul class="follw_list" id="friendModalList_1" style="height:420px;overflow:yes;overflow-x:hidden;">
        </ul>
      </div>
    </div>
  </div>
</div>

<input type="hidden" id="newProfileUrl" name="new_profile_url">
<div id="vProfileImageModal" class="modal" role="dialog" aria-hidden="true">
      <div class="modal-dialog" style="width:570px">
        <div class="modal-content" style="padding:0;">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><img src="http://recipe1.ezmember.co.kr/img/btn_close.gif" alt="�ݱ�"></span></button>
            <h4 class="modal-title">������ ���� / �ڱ�Ұ� ����</h4>
          </div>
          <div class="modal-body" style="padding:10px;text-align:center;">
                      <img id="vProfileImageModalSrc" src="http://recipe1.ezmember.co.kr/cache/rpf/2019/07/02/834a58aec2da85be5dbd0f308f1cc8b3.jpg" style="max-width:550px;max-height:500px;">
            <div style="margin-top:10px;">
            <input type="file" name="file" id="file_1" style="display:none;" />
			<p><input type="text" name="self_intro" value="" class="input-sm" size="60" maxlength="100" placeholder="�ڱ�Ұ��� 100�� �̳��� �ۼ��� �ּ���." /></p>
            <button type="button" onClick="document.getElementById('file_1').click();" class="btn btn-primary">������ ���� �ٲٱ�</button>
            <button type="button" id="profileSubmitBtn" onClick="doProfileImageSubmit()" class="btn btn-primary" disabled="disabled">����</button>
            </div>
                    </div>
        </div>
      </div>
    </div>
<script>
$(document).ready(function()
{
    $("#file_2").change(function(e) {
        handleBgFiles(e);
    });
});
</script>
<script type="text/javascript" src="http://recipe1.ezmember.co.kr/static/js/ez_dialog.min_20160430.js" charset="utf-8"></script>
<input type="hidden" id="newBgUrl" name="new_bg_url">
<div id="vBgImageModal" class="modal" role="dialog" aria-hidden="true">
  <div class="modal-dialog" style="width:570px">
    <div class="modal-content" style="padding:0;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><img src="http://recipe1.ezmember.co.kr/img/btn_close.gif" alt="�ݱ�"></span></button>
        <h4 class="modal-title">��� ���� ����</h4>
      </div>
      <div class="modal-body" style="padding:10px;text-align:center;">
        <img id="vBgImageModalSrc" src="http://recipe1.ezmember.co.kr/img/df/brand_top.png" style="max-width:550px;max-height:500px;">
        <div style="margin-top:10px;">
        <input type="file" name="file2" id="file_2" style="display:none;" />
        893 X 400
        <button type="button" onClick="document.getElementById('file_2').click();" class="btn btn-primary">��� ���� �ٲٱ�</button>
        <button type="button" id="bgSubmitBtn" onClick="doBgImageSubmit()" class="btn btn-primary" disabled="disabled">����</button>
        </div>
      </div>
    </div>
  </div>
</div>
	<div class="my_tabs">
	    <ul class="nav nav-tabs nav-justified" style="position:relative;">
	        <li role="presentation" class="active"><a href="myhome_recipe.jsp"><span class="glyphicon glyphicon-cutlery"></span>������</a></li>
	        <li role="presentation"><a href="myhome_after.jsp"><span class="glyphicon glyphicon-star"></span>�丮�ı�</a></li>
	        <li role="presentation"><a href="myhome_comment.jsp"><span class="glyphicon glyphicon-comment"></span>���</a></li>
	        <li role="presentation"><a href="myhome_talk.jsp"><span class="glyphicon glyphicon-user"></span>��ũ</a></li>
	    </ul>
	</div>
<form name="searchFrm">
	<input type="hidden" name="mode" value="public">
    <div class="chef_cont">
      <ul class="nav nav-tabs3" style="position:relative;">
        <li role="presentation" class="active"><a href="myhome_recipe.jsp">������</a></li>
        <li role="presentation" ><a href="myhome_recipe_write.jsp">�ۼ���</a></li>
            <div class="list_sort">
          <a href="myhome_recipe.jsp">�ֽż�</a>
          <a href="myhome_recipe_lookup.jsp">��ȸ��</a>
          <a href="myhome_recipe_scrap.jsp" class="active">��ũ����</a>
      </div>
            </ul>
      <div class="cont_list">
    <div class="result_none"><img src="http://recipe1.ezmember.co.kr/img/none_recipe.png">
        <p>�����Ǹ� ���� �÷�������!</p>
        �ڶ��ϰ� ���� ������ ������! �����ϰ� ���� ���� �����Ǹ� �÷� �ּ���.<br>
        <button type="button" onClick="location.href='/inbox/insert.html';" class="btn-lg btn-primary">������ ����ϱ�</button>
    </div>



        <div class="input-group info_srarch">
            <input type="text" name="qs" class="form-control" placeholder="" value="">
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit"><img src="http://recipe1.ezmember.co.kr/img/mobile/icon_search4.png"></button>
            </span>
        </div>
      </div><!--/cont_list -->
    </div><!--/chef_cont -->
</form>
  </div><!-- /contents_area -->
