package com.mm.point.model;

import java.util.List;

public interface PointDAO {
	/* public PointDTO pointTotal(int user_idx); */
	
	/**포인트 조회*/
	public int pointTotal(int user_idx);
	/**포인트 사용 및 적립*/
	public int pointInsert(PointDTO dto);
	/**정리일상 결제 포인트 조회*/
	public PointDTO svcPointSelect(String cate_idx);
	
	
	public int pointInsertManager(PointDTO dto);
	public List<PointDTO> pointList(int user_idx,int cp, int ls);
	public int pointCnt(int user_idx);
	
	

}
