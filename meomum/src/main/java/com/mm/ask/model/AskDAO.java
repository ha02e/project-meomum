package com.mm.ask.model;

import java.util.List;



public interface AskDAO {
	public int askInsert(AskDTO dto);
	public List<AskDTO> askList(int cp, int ls);
	public int askCnt();
	public AskDTO askContent(int ask_idx);
	public boolean existsFile(String fileName);
	public int commentsInsert(CommentsDTO dto);
	public CommentsDTO commList(int ask_idx);
}
