<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<div class="container sub_bg">
    <script>
$(document).ready(function(){
    $('.jq_elips3').ellipsis( {row : 3,  onlyFullWords: true} );
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
        data: "q_mode=getListFriend&page="+page+"&follow="+follow+"&uid=39584691",
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
	        <li role="presentation"><a href="myhome_recipe.jsp"><span class="glyphicon glyphicon-cutlery"></span>������</a></li>
	        <li role="presentation" class="active"><a href="myhome_after.jsp"><span class="glyphicon glyphicon-star"></span>�丮�ı�</a></li>
	        <li role="presentation"><a href="myhome_comment.jsp"><span class="glyphicon glyphicon-comment"></span>���</a></li>
	        <li role="presentation"><a href="myhome_talk.jsp"><span class="glyphicon glyphicon-user"></span>��ũ</a></li>
	    </ul>
	</div>
<style type="text/css">
.thumbs_hb { position: relative; width:200px; height:102px;overflow: hidden;}
.thumbs_hb img {position: absolute;left:50%;top: 50%;width: 100%; height:auto;
  -webkit-transform: translate(-50%,-50%);-ms-transform: translate(-50%,-50%);transform: translate(-50%,-50%);}
</style>
        <dt class="home_cont_tab st2">
            <a href="myhome_after_receive.jsp" class="tab_mn active">���� �丮 �ı�</a>
            <a href="myhome_after.jsp" class="tab_mn">���� �� �丮 �ı�</a>
        </dt>
        <div class="brand_cont mag_t_10">
            <ul class="cont_list st3 st3_1">
    <div class="result_none"><img src="http://recipe1.ezmember.co.kr/img/none_feel.png">
    <p>���� �丮�ıⰡ �����ϴ�.</p>
    ������ ������ ��� �丮�ı⿡ ����� �����ּ���.<br>
    ������ ������ �ְ� ���� �� �־��.
    </div>
        </ul>

    <nav class="text-center"><ul class="pagination"></ul></nav>  </div><!-- /contents_area -->
</div>
    <div id="right_area" class="col-xs-3">
    <div class="myhome_main" style="margin-bottom:20px;">
    <div class="myhome_main_t" style="background:url(http://recipe1.ezmember.co.kr/img/mobile/my_pic_d3.jpg) left top no-repeat; background-size:cover;"></div>
    <div class="myhome_main_info">
        <div class="info_pic">
            <a href="javascript:void(0);" onClick="$('#vProfileImageModal').modal('show')"><img src="http://recipe1.ezmember.co.kr/cache/rpf/2019/07/02/5ff2fd2df4cc2a820c7911ac86ee84fe1.jpg"></a>
            <a href="javascript:void(0);" class="info_set" onClick="$('#vProfileImageModal').modal('show')"><img src="http://recipe1.ezmember.co.kr/img/mobile/icon_camera2.png" alt="��������"></a>
        </div>
        <p class="info_name"><b>cloudsky</b>
                <span class="glyphicon glyphicon-pencil"></span><a href="javascript:void(0);" onClick="$('#vProfileImageModal').modal('show')"><u>�ڱ�Ұ��� ����� �� �ֽ��ϴ�.</u></a>
                </p>
        <div class="info_follow2">
                        <a href="javascript:void(0);">����ȸ<b>0</b></a><span>��</span>
            <a href="javascript:void(0);" onClick="viewFriendList('follower')">�ȷο�<b>0</b></a><span>��</span><a href="javascript:void(0);" onClick="viewFriendList('following')">�ȷ���<b>0</b></a>
        </div>
    </div>
</div>
<div class="blank_bottom"></div>
<div style="text-align:center;margin-top:10px">
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 10k_w_right_300_250 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:300px;height:250px"
     data-ad-client="ca-pub-1557771002660658"
     data-ad-slot="7619851795"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
</div>
<script type="text/javascript">
<!--
$(document).ready(function()
{
    EZ.countLog('event_etc_right','web','read','262');
});
//-->
</script>
<div style="margin:10px;">
    <a href="/event/262?q_from=event_etc_right" onClick="EZ.countLog('event_etc_right','web','click','262');"><img src="http://recipe1.ezmember.co.kr/cache/rpe/2019/07/01/62ef22dacbea4c44feaa1a167028f24c1.jpg" style="width:100%;"></a>
</div>

<script type="text/javascript">
<!--
$(document).ready(function()
{
    EZ.countLog('event_etc_right','web','read','261');
});
//-->
</script>
<div style="margin:10px;">
    <a href="/event/261?q_from=event_etc_right" onClick="EZ.countLog('event_etc_right','web','click','261');"><img src="http://recipe1.ezmember.co.kr/cache/rpe/2019/06/27/bd477e77ee10e777c5ea4d0145d7d7771.jpg" style="width:100%;"></a>
</div>

<script type="text/javascript">
<!--
$(document).ready(function()
{
    EZ.countLog('event_etc_right','web','read','259');
});
//-->
</script>
<div style="margin:10px;">
    <a href="/event/259?q_from=event_etc_right" onClick="EZ.countLog('event_etc_right','web','click','259');"><img src="http://recipe1.ezmember.co.kr/cache/rpe/2019/06/13/f610c8ae4b06ab6e631a7e1914888cdd1.jpg" style="width:100%;"></a>
</div>

<script type="text/javascript">
<!--
$(document).ready(function()
{
    EZ.countLog('event_etc_right','web','read','258');
});
//-->
</script>
<div style="margin:10px;">
    <a href="/event/258?q_from=event_etc_right" onClick="EZ.countLog('event_etc_right','web','click','258');"><img src="http://recipe1.ezmember.co.kr/cache/rpe/2019/06/05/9d762759513c197c5add4383719379041.jpg" style="width:100%;"></a>
</div>


    
    <div style="text-align:center;margin-top:10px">
    
        
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <!-- 10k_w_right_300_600 -->
    <ins class="adsbygoogle"
         style="display:inline-block;width:300px;height:600px"
         data-ad-client="ca-pub-1557771002660658"
         data-ad-slot="8777892938"></ins>
    <script>
    (adsbygoogle = window.adsbygoogle || []).push({});
    </script>
    
    </div>
    
        
    </div><!-- /right_area -->
    <div class="col-xs-12 sub_bg_btm"></div>
</div><!-- /container -->
