package com.mm.point.model;

import java.util.List;

public interface PointDAO {
	/* public PointDTO pointTotal(int user_idx); */
	public int pointTotal(int user_idx);
	public int pointInsert(PointDTO dto);
	public List<PointDTO> pointList(int user_idx,int cp, int ls);
	public int pointCnt(int user_idx);

}
