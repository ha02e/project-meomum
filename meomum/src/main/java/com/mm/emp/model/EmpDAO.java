package com.mm.emp.model;

import java.util.List;

public interface EmpDAO {
	public int empAdd(EmpDTO dto);
	public int empDel(int idx);
	public List<EmpDTO> empAllList();
	public EmpDTO empSearch(int idx);
	public int empUpdate(EmpDTO dto);

}
