package com.zbjdl.oa.wx.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zbjdl.oa.wx.util.MessageUtil;
import com.zbjdl.oa.wx.util.WxUtil;
import com.zbjdl.oa.wx.util.dto.TextNews;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 微信控制器
 * 
 * 
 * @since 2014-9-9 16:13:06
 */
@Controller
public class WxController extends BaseController {
	private Logger logger = LoggerFactory.getLogger(WxController.class);

	@RequestMapping(value = "/" )
	public String index(){
		return "redirect:/login.do";
	}

	/**
	 * 验证签名
	 * @param nonce 随机数
	 * @param echostr 随机字符串
	 */
	@RequestMapping(value = "/wx/mpapi.action" , method={RequestMethod.GET})
	public void checkSignature(@RequestParam(required=true) String signature ,
							   @RequestParam(required=true) String timestamp ,
							   @RequestParam(required=true) String nonce ,
							   @RequestParam(required=true) String echostr, HttpServletResponse response){
		logger.info("checkSignature:"+signature+";"+timestamp+";"+nonce+";"+echostr);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			// 通过检验signature对请求进行校验,若校验成功则原样返回echostr,否则接入失败
			if (WxUtil.checkSignature(signature, timestamp, nonce)) {
				out.print(echostr);
			} else {
				logger.error("签名校验失败,signature:{},timestamp:{},nonce:{},echostr:{}" ,
						signature , timestamp , nonce , echostr);
			}
		} catch (Exception e) {
			logger.error("签名校验失败" , e);
			logger.error("签名校验失败,signature:{},timestamp:{},nonce:{},echostr:{}" ,
					signature , timestamp , nonce , echostr);
		} finally {
			try {
				out.flush();
				out.close();
			} catch (Exception e){}
		}
	}
	
	/**
	 * 处理微信服务器发来的消息 
	 */
	@RequestMapping(value = "/wx/mpapi.action" , method={RequestMethod.POST})
	public void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
		long startTime = System.currentTimeMillis();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		processRequest(request , response);// 调用核心业务类接收消息、处理消息
		long endTime = System.currentTimeMillis();
		logger.info("微信处理事件用时：{}" , endTime - startTime);
	}
	
	//客服交互xml
	private String customerServiceXML = "<xml><ToUserName><![CDATA[%s]]></ToUserName><FromUserName><![CDATA[%s]]></FromUserName><CreateTime>%s</CreateTime><MsgType><![CDATA[transfer_customer_service]]></MsgType></xml>";
	

	/**
	 * “多客服”接口
	 * 处理微信发来的请求
	 * @throws Exception 
	 */
	private void processRequest(HttpServletRequest request , HttpServletResponse response) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Map<String, String> requestMap = MessageUtil.parseXml(request);
			String msgType = requestMap.get("MsgType");	// 消息类型
			String event = requestMap.get("Event");		//事件类型
			String fromUserName = requestMap.get("FromUserName");	// 发送方帐号
			String toUserName = requestMap.get("ToUserName");		// 公众帐号
			
			//处理菜单点击事件,这里不处理任何数据
			if(MessageUtil.REQ_MESSAGE_TYPE_EVENT.equals(msgType) && (MessageUtil.EVENT_TYPE_CLICK.equals(event) || MessageUtil.EVENT_TYPE_VIEW.equals(event))){
				String eventKey = requestMap.get("EventKey");
				logger.info("eventKey:"+eventKey);
				if(MessageUtil.EVENT_TYPE_CLICK.equals(event) && "V1002".equals(eventKey)){
					//点击菜单理财产品
					String message = "建设中";
					out.print(new TextNews(fromUserName , toUserName , message));
					out.flush();

					
				}else if(MessageUtil.EVENT_TYPE_CLICK.equals(event) && "V1003".equals(eventKey)){
					//点击菜单 信用卡
					String message = "建设中";
					out.print(new TextNews(fromUserName , toUserName , message));
					out.flush();			
					
				}else if(MessageUtil.EVENT_TYPE_CLICK.equals(event) && "V1004".equals(eventKey)){
					//点击菜单 我的金融
					String message = "建设中";
					out.print(new TextNews(fromUserName , toUserName , message));
					out.flush();			
					
				}else{
					out.print("");
					out.flush();
					return;					
				}

			}
			
			// 转发多客服
			if(MessageUtil.REQ_MESSAGE_TYPE_TEXT.equals(msgType)){
				//获取文本消息的内容
				String content = requestMap.get("Content");
				if("XXXX".equals(content.trim())){
					String contextPath = WxUtil.OA_WX_HOST + request.getContextPath();
					String message = "您好，欢迎使用YYY，请点击<a href='https://open.weixin.qq.com/connect/oauth2/authorize?appid=%appId%&redirect_uri=%redirectURL%/userApply/toApplyIndex.do&response_type=code&scope=snsapi_base&state=123#wechat_redirect'>申请ZZZ</a>进行开通。";
					out.print(new TextNews(fromUserName , toUserName , message.replaceAll("%appId%", WxUtil.WX_APPID).replaceAll("%redirectURL%", contextPath)));
					out.flush();
					return ;
				}else{//其他文本消息
					out.print(String.format(customerServiceXML, fromUserName , toUserName , System.currentTimeMillis()));
					out.flush();
					return;
				}
			}
			if(MessageUtil.REQ_MESSAGE_TYPE_IMAGE.equals(msgType) || MessageUtil.REQ_MESSAGE_TYPE_VOICE.equals(msgType)){
				out.print(String.format(customerServiceXML, fromUserName , toUserName , System.currentTimeMillis()));
				out.flush();
				return;
			} 
			// 事件推送
			if(MessageUtil.REQ_MESSAGE_TYPE_EVENT.equals(msgType)){
				//订阅事件 ,关注后发送
				if(MessageUtil.EVENT_TYPE_SUBSCRIBE.equals(event)){
					String contextPath = WxUtil.OA_WX_HOST + request.getContextPath();
					String message = "欢迎来到八戒财税oa";
					out.print(new TextNews(fromUserName , toUserName , message.replace("%appId%", WxUtil.WX_APPID).replace("%redirectURL%", contextPath)));
					out.flush();
					return;
				}
				//扫描场景二维码事件
				else if(MessageUtil.EVENT_TYPE_SCAN.equals(event)){
					out.print("");
					out.flush();
					logger.info("已关注用户[{}]扫描二维码" , fromUserName);
					return;
				}
				else if(MessageUtil.TEMPLATES_SEND_JOB_FINSH.equals(event)){
					logger.info("模板消息发送反馈" , requestMap);

				}
			}
			out.print("");
			out.flush();
			logger.info("未处理的微信请求,msgType:{} , event:{} , 请求内容：{}" , msgType , event , requestMap);
		} catch (Exception e) {
			logger.error("error receive message" , e);
		} finally {
			out.close();
		}
	}
}	
