<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<div id="contents_area" class="col-xs-9">
    <div class="row talk_title st2">
        <div class="col-xs-7">
            <p>ü��� �ı�</p>
        </div>
        <div class="col-xs-5 text-right">
            <div class="list_sort">
                <a href="event_review.jsp" data="seq" class="active">��ϼ�</a>
                <a href="event_comment.jsp" data="comment_cnt" >��ۼ�</a>
                <a href="event_lookup.jsp" data="read_cnt" >��ȸ��</a>
            </div>
        </div>
    </div>
    <div class="blank_bottom"></div>
    <div class="info_list">
        <div style="height:50px; border-bottom:1px solid #ddd; margin-bottom:20px;">
            <div class="input-group info_srarch" style=" width:420px; float:right;">
                <select id="srhtg1" text="����">
                <option value="title_cont">����+����</option>
                <option value="title">����</option>
                <option value="content">����</option>
                <option value="user_id">���̵�</option>
                <option value="user_nm">�г���</option>
                </select>
                <input type="text" id="srhkwds1" class="form-control" style="width:280px;">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" onclick="doSearch(1)"><img src="http://recipe1.ezmember.co.kr/img/mobile/icon_search4.png"></button>
                </span>
            </div>
        </div>
        <div class="media">
            <div class="media-left">
                <a href="/event/view_review.html?seq=241">
                    <img class="media-object" src="http://recipe1.ezmember.co.kr/cache/rpt/2019/05/08/thumb_350a3e406af6714655612530a38984da.jpg" data-holder-rendered="true" style="width: 150px; height: 150px;">
                </a>
            </div>
            <div class="media-body media-middle">
                <a href="/event/view_review.html?seq=241">
                <h4 class="media-heading jq_elips" id="media-heading">��� ���丮���̸� ������ ���� �Ծ�ô�!</h4>
                <p class="info_summary jq_elips2"> ��� ���丮���̸� ������ ���� �Ծ�ô�! ȭ���� �� ��ŭ ���� �ʱ��ʱ� ������ �Ͱ�����? ���� ����~ 88~ �����ݴϴ� ! 100������ ���� ������ ���� �����ϰ� ����! ���丮���̸��̶� �̷��� �Ϳ��� ����?���丮��� ĳ���� ��� �־��ݴϴ�. �߰ſ��� ������.. ��� ���丮���̸��� ���̶���Ʈ �ٷ� ���޻��޴����� ����ҽ�~ ���� ���� ������ �ľ��ָ� ���� �ʱ��ʱ� ���ִ�ϴ�! �������� �ľ��ָ� �� ������,, ������ �����Ƿ� �н�~ ����ҽ� ����~ �񺭺�~~ ���� ���ְ� �Դ� �ϸ� ������~? ���̴� ����� �� ������ ������ ..</p>
                </a>
                <a href="https://blog.naver.com/796236/221532357520" target="_blank"><p class="info_url jq_elips">https://blog.naver.com/796236/221532357520</p></a>                <p class="info_writer">���λ굵<span>|</span>2019-05-08 14:11<span>|</span><span class="cate_view">164</span><span>|</span><span class="cate_comment">0</span></p>
            </div>
        </div>
        <div class="media">
            <div class="media-left">
                <a href="/event/view_review.html?seq=240">
                    <img class="media-object" src="http://recipe1.ezmember.co.kr/cache/rpt/2019/05/01/thumb_11171e0bfea2ffe423718b4ea4f66dd6.jpg" data-holder-rendered="true" style="width: 150px; height: 150px;">
                </a>
            </div>
            <div class="media-body media-middle">
                <a href="/event/view_review.html?seq=240">
                <h4 class="media-heading jq_elips" id="media-heading">���丮���̸� �����ı� + ���ְԸԱ�</h4>
                <p class="info_summary jq_elips2"> #���丮���̸� #��ɵ��丮���̸� #��ɺ���� #����ȣ�Ĵ� #�Ż���    /�� ���� ����麸�� ���ִ� ���丮���̸�¦���� ��¾�� ������ �츮 ģ�� �ı��� �Ը��� �´� ���̰�, �׵��� ��� ����� �ŴϾƴ�.  ���� ������� ���ƴ� ������, �����İ� ���� ���̾��ͺ�(�̰� ����)���� ��� ������ ������� ���� ���ļ� ���԰� �Ǿ���.�׸��� �ڱ��� ���� �� �������� ���򳪴� ���丮���̸��� �˰Ե�..* �ŽǼҽ����� ���� ����ٴ� �ҽ��� �� ���ִ�, �׸��� ���� ��� ���⸧ �ּ� �ѷ� ���� ����...�ְ��� ����̾�, �Դ� ���� ��ŭ�� ������..</p>
                </a>
                <a href="https://blog.naver.com/rainlll/221526588750" target="_blank"><p class="info_url jq_elips">https://blog.naver.com/rainlll/221526588750</p></a>                <p class="info_writer">����Ʈ��<span>|</span>2019-05-01 02:07<span>|</span><span class="cate_view">101</span><span>|</span><span class="cate_comment">0</span></p>
            </div>
        </div>
        <div class="media">
            <div class="media-left">
                <a href="/event/view_review.html?seq=239">
                    <img class="media-object" src="http://recipe1.ezmember.co.kr/cache/rpt/2019/05/01/thumb_cbc292bf65fc874e0de4dcea830740ab.jpg" data-holder-rendered="true" style="width: 150px; height: 150px;">
                </a>
            </div>
            <div class="media-body media-middle">
                <a href="/event/view_review.html?seq=239">
                <h4 class="media-heading jq_elips" id="media-heading">���丮���̸� �ǿ��� ����!��� ������ǰ �Ծ�Ҵ�.</h4>
                <p class="info_summary jq_elips2"> ���丮���̸� �ǿ��� ����!��� ������ǰ �Ծ�Ҵ�. �ȳ��ϼ��� ���������Դϴ�. ���� ���� �ٻ� �Ϸ���� �������ִµ���.�̴�δ� ��α׸� �ƾ� �� ���ڴ� �; �Բ� ���ϴ� ������ ��α׸� �����߾��..����1�� 1���������� ���� 3���̸� ���� �ٵ� �� ���� ��Ʋ° �� ���� �嵮 3��° �����ξ��� ������ ���½��ϴ�.�ٷ� ��� ������ǰ ���丮���̸�!  ��� ������� �ʹ� �����ؼ� ���丮 ���̸��� ���Դٱ淡 ���� �ñ��ߴµ���. ��¥ ���丮�� �����Ǿ� �־� ���� �̱� �̱��� ��߰� ���� ����, �ŽǷ� ���� �� �ҽ�����!���� ���� ����..</p>
                </a>
                <a href="http://blog.naver.com/PostView.nhn?blogId=kkot_nim2&logNo=221526674175" target="_blank"><p class="info_url jq_elips">http://blog.naver.com/PostView.nhn?blogId=kkot_nim2&logNo=221526674175</p></a>                <p class="info_writer">HEYJINA<span>|</span>2019-05-01 00:59<span>|</span><span class="cate_view">65</span><span>|</span><span class="cate_comment">0</span></p>
            </div>
        </div>
        <div class="media">
            <div class="media-left">
                <a href="/event/view_review.html?seq=238">
                    <img class="media-object" src="http://recipe1.ezmember.co.kr/cache/rpt/2019/04/30/thumb_78d3f16d3df4dfdfc48f362d82181b23.jpg" data-holder-rendered="true" style="width: 150px; height: 150px;">
                </a>
            </div>
            <div class="media-body media-middle">
                <a href="/event/view_review.html?seq=238">
                <h4 class="media-heading jq_elips" id="media-heading">����ǰ ���丮���̸� �Ծ�þ��.</h4>
                <p class="info_summary jq_elips2"> ��ɿ��� ����ǰ ���Գ׿�. �޹й��� ���� �������ϴµ� ���丮���� ��û �����ϰŵ��. �޹й��� ����԰�, ���丮���� ����Դµ���. �޹��� �������� ���� ���丮�� �����ؼ� ���ƿ�.���� �󸶳� �������� ��û ��븦 �ϰ� ���丮���̸� �Ծ�ϴ�.�������� ���丮�. �Ϳ�~ �Ϳ�����.���� ���� ���丮���̸� ������ ���丮���̸�1��, ����ݼ� �ݰ�, �볪�� ����. ���̶󼭿� ����� �볪�� ��ģ�Ͱ� �Բ� �Ծ����. ������ ���̸� ��߰� ���,�ƻ��� �볪�� �߾��Ⱦ��.   ���� ��Ʈ�θ����� ���� �̶�鼭��.? �� 20���ʹݶ� �н����׸�....��..</p>
                </a>
                <a href="https://blog.naver.com/farm700song/221526538117" target="_blank"><p class="info_url jq_elips">https://blog.naver.com/farm700song/221526538117</p></a>                <p class="info_writer">���Ǽ۰��׳���<span>|</span>2019-04-30 21:51<span>|</span><span class="cate_view">46</span><span>|</span><span class="cate_comment">0</span></p>
            </div>
        </div>
        <div class="media">
            <div class="media-left">
                <a href="/event/view_review.html?seq=237">
                    <img class="media-object" src="http://recipe1.ezmember.co.kr/cache/rpt/2019/04/30/thumb_e38d2a5a8b8b48f129ea072afbfbf668.jpg" data-holder-rendered="true" style="width: 150px; height: 150px;">
                </a>
            </div>
            <div class="media-body media-middle">
                <a href="/event/view_review.html?seq=237">
                <h4 class="media-heading jq_elips" id="media-heading">#[��� ���丮 ���̸�] ��Ʈ�� ������ǰ ���丮���̸顯 ���ְ� ���� �ı�!</h4>
                <p class="info_summary jq_elips2"> ��� ���丮 ���̸�    �ȳ��ϼ��� :) �丮��ȫ����Դϴ�.������ �������� ��� �Դ� ���� ���ϳ��� �ٷ� �����, �̸��ε���~���� ���������鼭 ���� ����������� �����԰� �־��.   ���� �����ϴ� ������ �Դ¡ڻ���+����� ����!!   ��ɿ��� �̹��� ����� ����ǰ�� ���Ӱ� ��õż� �Ծ� �ý��ϴ�!���丮���̸��� 1993�⿡ ���丮�������������ߴٰ� ������ ��ǰ�������Ƕ�鿡 �̾� ����� ���� �����̴� �� ��° ��Ʈ�� ��ǰ�̶�� �ؿ�!     ��Ʈ�� ������ ��Ű���� ����ũ�� ����!   �̹��� ���丮���̸��� ����õǸ鼭 �ҽ��� ���� ���׷��̵��ߴٰ� ..</p>
                </a>
                <a href="http://blog.naver.com/killua19/221526536224" target="_blank"><p class="info_url jq_elips">http://blog.naver.com/killua19/221526536224</p></a>                <p class="info_writer">�丮��ȫ���<span>|</span>2019-04-30 21:48<span>|</span><span class="cate_view">34</span><span>|</span><span class="cate_comment">0</span></p>
            </div>
        </div>
        <div class="media">
            <div class="media-left">
                <a href="/event/view_review.html?seq=236">
                    <img class="media-object" src="http://recipe1.ezmember.co.kr/cache/rpt/2019/04/30/thumb_210f702dcc6ec25c74a5dc8a98dddfa2.jpg" data-holder-rendered="true" style="width: 150px; height: 150px;">
                </a>
            </div>
            <div class="media-body media-middle">
                <a href="/event/view_review.html?seq=236">
                <h4 class="media-heading jq_elips" id="media-heading">[��� ���丮 ���̸�] �Ը� ������ �̱��̱� ���޴��� ���丮 ���̸�</h4>
                <p class="info_summary jq_elips2">    ���� ���� ������� �� �̷��� ������,�Ʊ���� ���⿡ �ɷ��� �㿡 �ᵵ �� ���ڰ�׷��� �ڿ����� ������ ���� ���� ���� ���Ŀ������ ���ڸ� �Ը��� ���� ���� ì�ܸ԰� ������и��� ���� �ʾ� ���� �Ʊ� ���ڷ� �Ļ縦 ����Ҷ��� ����. �׷��� ���� ���İ��Ǹ�������� ���� ���� �߽��� ��ǳ �����ϴ� ��ȿ���� �������� ��Ȱ�� �ϰ� �־��.���̾�Ʈ �Ѵٰ� ���� ���θ� ������°͵����� ��ġ���� ���ϰھ�䤻��Į�θ� ���� ���ڴ�� ���ְ� �����ϰ� �ѳ� �ذ��� �Ը��� ������ �� ���𰡸� ã�� �ִ����� �� ��Ÿ�� ��� ���丮 ���̸� ��!~~��..</p>
                </a>
                <a href="http://blog.naver.com/PostView.nhn?blogId=see823&logNo=221521841785" target="_blank"><p class="info_url jq_elips">http://blog.naver.com/PostView.nhn?blogId=see823&logNo=221521841785</p></a>                <p class="info_writer">���ڸŸ���<span>|</span>2019-04-30 21:36<span>|</span><span class="cate_view">19</span><span>|</span><span class="cate_comment">0</span></p>
            </div>
        </div>
        <div class="media">
            <div class="media-left">
                <a href="/event/view_review.html?seq=235">
                    <img class="media-object" src="http://recipe1.ezmember.co.kr/cache/rpt/2019/04/30/thumb_cd754a67ac32b0d5903af8d8c7d972b7.jpg" data-holder-rendered="true" style="width: 150px; height: 150px;">
                </a>
            </div>
            <div class="media-body media-middle">
                <a href="/event/view_review.html?seq=235">
                <h4 class="media-heading jq_elips" id="media-heading">���丮���̸�,���ϰ� �Ž��� ���� ������ �Դ� �� �̸� ����~</h4>
                <p class="info_summary jq_elips2"> ���� 5���� ���۵˴ϴ�, �ټ� 4���� ���⵵ �ߴٰ� ��¦ ��⵵ �ߴٸ� 5���� ���� ������ ���Ͽ� ���� �ñ�� �� �� �ְ�����, �۳� 5���� ���ֵ� ���� ����� ������ ������ ���� 1���� �����׿�, ��� ���� �� ���� ���� ���ٰ�� ���� �� �������� ���� �Ұ��� �帱 ���丮���̸��� ������ �� ���� �Ծ�ô� �� ���̶�� �ұ��?</p>
                </a>
                <a href="http://blog.naver.com/PostView.nhn?blogId=im7769&logNo=221526462022" target="_blank"><p class="info_url jq_elips">http://blog.naver.com/PostView.nhn?blogId=im7769&logNo=221526462022</p></a>                <p class="info_writer">pomnanda<span>|</span>2019-04-30 21:20<span>|</span><span class="cate_view">23</span><span>|</span><span class="cate_comment">0</span></p>
            </div>
        </div>
        <div class="media">
            <div class="media-left">
                <a href="/event/view_review.html?seq=234">
                    <img class="media-object" src="http://recipe1.ezmember.co.kr/cache/rpt/2019/04/30/thumb_7f8ace8f21cc2fb6b99b2166b0c56d89.jpg" data-holder-rendered="true" style="width: 150px; height: 150px;">
                </a>
            </div>
            <div class="media-body media-middle">
                <a href="/event/view_review.html?seq=234">
                <h4 class="media-heading jq_elips" id="media-heading">���丮���̸� ����� ����ǰ ���������� �Ծ�þ��</h4>
                <p class="info_summary jq_elips2">��Ʈ�� ������ ��� ����ǰ ���丮���̸� �ٵ� �ƽó��� ~~??���� �ñ��ؼ� �Ծ�ôµ� �Ϳ� ! ���� ¯¯ !! �Ա� �� �ߴٴ� ������ ����󱸿� ~ �׸��� ���� ������ �� ������ ������ ���� ~ �Ұ��ص帱�Կ� ! ���丮�� �� �ִ� ���̶� �� �ʱ��ʱ� �̱��̱� �ϴ��󱸿� ~~ </p>
                </a>
                <a href="http://blog.naver.com/PostView.nhn?blogId=ryunny000&logNo=221525476123" target="_blank"><p class="info_url jq_elips">http://blog.naver.com/PostView.nhn?blogId=ryunny000&logNo=221525476123</p></a>                <p class="info_writer">ryunnny3827<span>|</span>2019-04-30 19:24<span>|</span><span class="cate_view">19</span><span>|</span><span class="cate_comment">0</span></p>
            </div>
        </div>
        <div class="media">
            <div class="media-left">
                <a href="/event/view_review.html?seq=233">
                    <img class="media-object" src="http://recipe1.ezmember.co.kr/cache/rpt/2019/04/30/thumb_1eade14e48f0e87d286ac688bede4010.jpg" data-holder-rendered="true" style="width: 150px; height: 150px;">
                </a>
            </div>
            <div class="media-body media-middle">
                <a href="/event/view_review.html?seq=233">
                <h4 class="media-heading jq_elips" id="media-heading">��� ����ǰ ��� ���丮���̸� ����Ż�̾�</h4>
                <p class="info_summary jq_elips2"> �ȳ��ϼ��� �����̿� ������ ���� ����ϴ� ��ΰ� �ϺϾ�������. �̹��� ��ɿ��� ��ɽ���ǰ ����� ���°��� �˰� ��ó���?���� ���� �������ݾƿ�~ ���� �ִ� ��ɿ��� ���� ����� �ٸ��ƴ� &lt;���丮���̸�&gt;�̶�� �մϴ�. �̸��� �� �Ϳ��� �ʳ���?���丮���̸� ~ �̸� �Ѱ� �Ծ� ���Ҵµ�. �ö�� �����Ͻð� �̸��� �����ϰ� �ణ �ſ� �� �����Ͻô� ���� �� ��鵵 �������� ������~�;���� �̹� �� ����� �ŷ¿� ǳ~�� ������ϴ�. ��Ʈ���� ������ ���� ǳ����?^^ 80��� �α��..</p>
                </a>
                <a href="http://blog.naver.com/PostView.nhn?blogId=22511&logNo=221526140313" target="_blank"><p class="info_url jq_elips">http://blog.naver.com/PostView.nhn?blogId=22511&logNo=221526140313</p></a>                <p class="info_writer">�ϺϾ���<span>|</span>2019-04-30 17:30<span>|</span><span class="cate_view">14</span><span>|</span><span class="cate_comment">0</span></p>
            </div>
        </div>
        <div class="media">
            <div class="media-left">
                <a href="/event/view_review.html?seq=232">
                    <img class="media-object" src="http://recipe1.ezmember.co.kr/cache/rpt/2019/04/30/thumb_6371ff1b22fee17a101c86b998d58510.jpg" data-holder-rendered="true" style="width: 150px; height: 150px;">
                </a>
            </div>
            <div class="media-body media-middle">
                <a href="/event/view_review.html?seq=232">
                <h4 class="media-heading jq_elips" id="media-heading">��� ���丮 ���̸� �߽����� ���ְ� �Ծ����^~^</h4>
                <p class="info_summary jq_elips2"> ��� ���丮 ���̸� �߽����� ���ְ� �Ծ����^~^ ��� ���丮 ���̸� ü��ܿ� ��û�Ͽ� ��÷�� �Ǿ�߽����� �̱��̱��ϰ������ �Ծ����. ó�� �Ծ�³�� ���丮 ���̸� ����ϱ��?�̸��� �����ϴ� �츮 �ı����ܶ� ����� ���ϴ�. �䷸�� ����� ������ �� ������ ��� ���ִٰ� �ؿ�..�׷� ���� �丮�� ������ ���ϴ�. </p>
                </a>
                <a href="https://m.blog.naver.com/adcook0516/221525669699" target="_blank"><p class="info_url jq_elips">https://m.blog.naver.com/adcook0516/221525669699</p></a>                <p class="info_writer">��黩�����<span>|</span>2019-04-30 17:14<span>|</span><span class="cate_view">20</span><span>|</span><span class="cate_comment">0</span></p>
            </div>
        </div>
        <div class="media">
            <div class="media-left">
                <a href="/event/view_review.html?seq=231">
                    <img class="media-object" src="http://recipe1.ezmember.co.kr/cache/rpt/2019/04/30/thumb_18f154d893b5b5a388f972438e357c8f.jpg" data-holder-rendered="true" style="width: 150px; height: 150px;">
                </a>
            </div>
            <div class="media-body media-middle">
                <a href="/event/view_review.html?seq=231">
                <h4 class="media-heading jq_elips" id="media-heading">�߾��� ���ϻ���, ��������~ ��� ���丮 ���̸�</h4>
                <p class="info_summary jq_elips2"> ������� ����~ ���̵� ä��� �ְ������� ������ �ݻ�÷ȭ^^������ġ�� ������ ȯ�����!!�׷��� �װ͵� ���ڶ� ���丮���̸�? ��..��� �̸� �Ծ���� �������� ���� 20���� �Ž��� �ö󰡾��ϴ� ������ ����ϰ� �ִ°� �ƴϽ���? ��..���� ����..���� �Ծ����.�������;��̵�� HOT ���븦 ���´�����.��� �̸��� �н��� �ܰ�޴�...</p>
                </a>
                <a href="http://blog.naver.com/PostView.nhn?blogId=chdklove&logNo=221526243272" target="_blank"><p class="info_url jq_elips">http://blog.naver.com/PostView.nhn?blogId=chdklove&logNo=221526243272</p></a>                <p class="info_writer">Ǯ�ٸԴ±���<span>|</span>2019-04-30 15:30<span>|</span><span class="cate_view">19</span><span>|</span><span class="cate_comment">1</span></p>
            </div>
        </div>
        <div class="media">
            <div class="media-left">
                <a href="/event/view_review.html?seq=230">
                    <img class="media-object" src="http://recipe1.ezmember.co.kr/cache/rpt/2019/04/30/thumb_2140e27c6c288f1faaf13d67fb774705.jpg" data-holder-rendered="true" style="width: 150px; height: 150px;">
                </a>
            </div>
            <div class="media-body media-middle">
                <a href="/event/view_review.html?seq=230">
                <h4 class="media-heading jq_elips" id="media-heading">��� ���丮 ���̸� ������ ������ ���ְ� ���̴� ��</h4>
                <p class="info_summary jq_elips2">  �̹��� ���� ����ǰ ��� ���丮 ����� ���丮 ���̸�? �̸����� ǳ������ ���� Į�θ��� �� ������ ���������� �� ���ſ�ϱ��. �����ϰ� ���� ������ ��� �� ���� �� �ִ�������� ��ǳ���� �α⸦ ���� �ִµ��̹��� ���Ӱ� ��õ� ���丮 ����� ���� �αⰡ ����Ǵ�..���ݱ����� ������ ���丮�� ���� ���̸��̶� �� ���� �� ��밡 �Ǵ��󱸿�.</p>
                </a>
                <a href="http://blog.naver.com/PostView.nhn?blogId=lotusms12&logNo=221517759093" target="_blank"><p class="info_url jq_elips">http://blog.naver.com/PostView.nhn?blogId=lotusms12&logNo=221517759093</p></a>                <p class="info_writer">�޻�ٶ�<span>|</span>2019-04-30 15:15<span>|</span><span class="cate_view">14</span><span>|</span><span class="cate_comment">0</span></p>
            </div>
        </div>
    </div>
    <nav class="text-center"><ul class="pagination"><li class="active"><a href="/event/srh_review.html?page=1">1</a></li><li><a href="/event/srh_review.html?page=2">2</a></li><li><a href="/event/srh_review.html?page=3">3</a></li><li><a href="/event/srh_review.html?page=4">4</a></li><li><a href="/event/srh_review.html?page=5">5</a></li><li><a href="/event/srh_review.html?page=6">6</a></li><li><a href="/event/srh_review.html?page=7">7</a></li><li><a href="/event/srh_review.html?page=8">8</a></li><li><a href="/event/srh_review.html?page=9">9</a></li><li><a href="/event/srh_review.html?page=10">10</a></li><li><a href="/event/srh_review.html?page=11" aria-label="Next"><span aria-hidden="true">&gt;</span></a></li></ul></nav>
    <div class="input-group info_srarch" style=" width:420px;">
        <select id="srhtg2" text="����">
        <option value="title_cont">����+����</option>
        <option value="title">����</option>
        <option value="content">����</option>
        <option value="user_id">���̵�</option>
        <option value="user_nm">�г���</option>
        </select>
        <input type="text" id="srhkwds2" class="form-control" style="width:280px;">
        <span class="input-group-btn">
            <button class="btn btn-default" type="button" onClick="doSearch(2)"><img src="http://recipe1.ezmember.co.kr/img/mobile/icon_search4.png"></button>
        </span>
    </div>
</div>
