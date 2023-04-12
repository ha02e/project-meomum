package com.mm.module;

public class PageModule {
	public static String makePage(
			String pagename, int totalCnt, 
			int listSize, int pageSize,int cp) {

		StringBuffer sb = new StringBuffer();

		int totalPage=totalCnt / listSize + 1;
		if(totalCnt%listSize==0) totalPage--;


		int userGroup=cp / pageSize;
		if(cp%pageSize==0)userGroup--;
		
		if(userGroup!=0){
			sb.append("<li class='page-item'><a class='page-link link-dark' href='");
			sb.append(pagename); 
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append("'><i class='bi bi-chevron-double-left'></i></a></li>");
		}
						
			for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
			sb.append("<li class='page-item'><a class='page-link link-dark' href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a></li>");
			if(i==totalPage) break;
			}
				
			if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link link-dark' href='");
				sb.append(pagename);
				sb.append("?cp=");
				int temp=(userGroup+1)*pageSize+1;
				sb.append(temp);
				sb.append("'><i class='bi bi-chevron-double-right'></i></a></li>");

			}
			
			return sb.toString();
	}
	
	public static String makePageParam(
			String pagename, int totalCnt, 
			int listSize, int pageSize,int cp,String param) {

		StringBuffer sb = new StringBuffer();

		int totalPage=totalCnt / listSize + 1;
		if(totalCnt%listSize==0) totalPage--;


		int userGroup=cp / pageSize;
		if(cp%pageSize==0)userGroup--;
		
		if(userGroup!=0){
			sb.append("<li class='page-item'><a class='page-link link-dark' href='");
			sb.append(pagename); 
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			sb.append(param);
			sb.append("'><i class='bi bi-chevron-double-left'></i></a></li>");
		}
						
			for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
			sb.append("<li class='page-item'><a class='page-link link-dark' href='");
			sb.append(pagename);
			sb.append("?cp=");
			sb.append(i);
			sb.append(param);
			sb.append("'>");
			sb.append(i);
			sb.append("</a></li>");
			if(i==totalPage) break;
			}
				
			if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link link-dark' href='");
				sb.append(pagename);
				sb.append("?cp=");
				int temp=(userGroup+1)*pageSize+1;
				sb.append(temp);
				sb.append(param);
				sb.append("'><i class='bi bi-chevron-double-right'></i></a></li>");

			}
			
			return sb.toString();
	}
}
