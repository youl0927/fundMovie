package com.bbq.fundmovie.auction.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bbq.fundmovie.auction.service.AuctionService;
import com.bbq.fundmovie.vo.AuctionApplyListVo;
import com.bbq.fundmovie.vo.AuctionImagesVo;
import com.bbq.fundmovie.vo.AuctionVo;
import com.bbq.fundmovie.vo.MemberVo;

@Controller
@RequestMapping("/auction/*")
public class AuctionController {
	
	@Autowired
	private AuctionService auctionService;
	
	@RequestMapping("join_auction_process.do")
	public String joinAuctionProcess(HttpSession session, int auction_no) {
		
		
		//경매 정보 불러오기
		AuctionVo auctionVo = auctionService.auctionInform(auction_no);
		
		//예상가 불러오기
		int estimate_price = auctionVo.getEstimate_price();
			System.out.println("estimate_price: "+estimate_price);
		//현재가 불러오기
		int current_money = auctionVo.getCurrent_price();
			System.out.println("current_money: "+current_money);
		//단위가격 불러오기	
		int gap_money = estimate_price/30;
			System.out.println("gap_money: "+gap_money);
		//내 구매가격 구하기: 현재가+단위가격	
		int my_spent_money =current_money+ gap_money;
		System.out.println("my_spent_money: "+my_spent_money);
		//포인트 지르기

		//현재가 업데이트 하기
		auctionVo.setCurrent_price(my_spent_money);
		auctionService.updateAuctionPrice(auctionVo);
		
		//남은 경매시간 확인하기
		Date now = new Date();
		long now1 = now.getTime();
		Date previous = auctionVo.getClosing_date();
		long previous1 = previous.getTime();
		
		System.out.println("마감 시간"+previous1);
		System.out.println("현재 시간"+now1);
		
		long diff =  previous1-now1;
		
		//남은 경매 시간 늘리기
		System.out.println("시간차"+diff);

		if(diff < 60000) {
			System.out.println("시간을 늘립시당");
			auctionService.updateAuctionTime(auction_no);
		}
		
				
		//경매 참가 리스트 업데이트
		//참가 정보 집어넣기
		MemberVo sessionUser = 
				(MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no(); 
		
		AuctionApplyListVo vo = new AuctionApplyListVo();
		vo.setAuction_no(auction_no);
		vo.setAuction_user_no(user_no);
		vo.setCall_price(0);
		
		AuctionApplyListVo applyListVo = auctionService.auctionApplyListInform(vo);
		
		applyListVo.setCall_price(my_spent_money);
		int my_total_price = applyListVo.getTotal_call_price();
		System.out.println("total_previus"+my_total_price);
		my_total_price += my_spent_money;
		System.out.println("total_this"+my_total_price);
		applyListVo.setTotal_call_price(my_total_price);
			
		auctionService.joinAuctionInform(applyListVo);

		System.out.println("돌아가기");
		return "redirect:./auction_main.do";
		
	}
	
	
	
	
	@RequestMapping("auction_main.do")
	public String auctionMain(Model model) {
		
		ArrayList<HashMap<String, Object>> resultList = 
				auctionService.getAuctionList();
		
		model.addAttribute("resultList", resultList);
		
		return "/auction/auction_main_page";
	}

	@RequestMapping("auction_main_cover.do")
	public String auctionMainCover() {
		return "/auction/auction_main_cover";
	}
	
	@RequestMapping("add_auction.do")
	public String addAuction() {
		return "/auction/add_auction_page";
	}
	
	@RequestMapping("add_auction_inform.do")
	public String addAuctionInform() {
		return "/auction/add_auction_inform_page";
	}
	
	@RequestMapping("add_auction_images.do")
	public String addAuctionImages(Model model, int auction_no) {
		model.addAttribute("auction_no", auction_no);
		return "/auction/add_auction_images";
	}
	
	@RequestMapping("add_auction_confirm.do")
	public String addAuctionConfirm(Model model, int auction_no) {
		System.out.println("auction_no: "+auction_no);
		HashMap<String, Object> map = auctionService.getAuctionInform(auction_no);
		
		model.addAttribute("auctionResult", map);
		
		return "/auction/add_auction_confirm";
	}
	
	@RequestMapping("delete_auction_inform_process.do")
	public String deleteMovieProcess(int auction_no) {
		
		auctionService.deleteAuctionInform(auction_no);
		
		return "redirect:./auction_main.do";
	}
	
	@RequestMapping("confirm_auction_inform_process.do")
	public String confirmAuctionInform(int auction_no) {
		
		auctionService.confirmAuctionInform(auction_no);
		
		return "redirect:./auction_main.do";
	}
	
	
	@RequestMapping("add_auction_inform_process.do")
	public String addAuctionInformProcess(AuctionVo param, HttpSession session) {
		
		MemberVo sessionUser = 
				(MemberVo)session.getAttribute("sessionUser");
		int user_no = sessionUser.getUser_no(); 
		System.out.println("controller1 auction_no"+param.getAuction_no());
		param.setUser_no(user_no);
		int estimate_price = param.getEstimate_price();
		int start_money = estimate_price*3/10;
		param.setCurrent_price(start_money);
		
		int auction_no = auctionService.addAuctionInform(param);
		System.out.println("controller1-1 auction_no"+param.getAuction_no());

		
		return "redirect:./add_auction_images.do?auction_no="+auction_no;
	}
	
	@RequestMapping("add_auction_images_process.do")
	public String addAuctionImagesProcess(HttpSession session, AuctionImagesVo param, MultipartFile file) {
		System.out.println("controller2 auction_no"+param.getAuction_no());

		System.out.println("Auction_no: "+param.getAuction_no());
		//업로드....
			int auction_no = param.getAuction_no();	
			//날짜별 폴더를 만들기....!!!
			// ..../년도/월/일/랜덤_시간.jpg ...
			String uploadRootFolderName = "C:/upload_files/";
			
			Date today = new Date(); 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolder = sdf.format(today);
			
			String uploadFolderName = uploadRootFolderName + todayFolder;
			
			File uploadFolder = new File(uploadFolderName); 
			
			if(!uploadFolder.exists()) {
				uploadFolder.mkdirs();
			}
			
			

			String originalFileName = file.getOriginalFilename();
			System.out.println(originalFileName);
			//저장시.. 파일명을 변경 
			//목적 : 충돌 방지(덮어 씌우기 방지)
			//방법 : 랜덤 + 시간
			
			String randomName = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			
			randomName = randomName + "_" + currentTime;
			
			//확장자 추가...(오리지널 파일 이름에서 뽑아와야됨)
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			randomName += ext;

			
			try {
				file.transferTo(new File(uploadFolderName + "/" + randomName));
											
				
			}catch(Exception e) {		
				e.printStackTrace();
			}
			
			//..ImageVo 객체 생성....
								 
			String link = "/upload/" + todayFolder + "/" + randomName;
			
			param.setAuction_main_img(link);
			auctionService.addAuctionImages(param);
			
			return "redirect:./add_auction_confirm.do?auction_no="+auction_no;
			
	}
	
	
}
