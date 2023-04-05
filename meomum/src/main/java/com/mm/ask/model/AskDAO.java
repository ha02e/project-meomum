package com.mm.ask.model;

import java.util.List;



public interface AskDAO {
	public int askInsert(AskDTO dto);
	public List<AskDTO> askList(int cp, int ls,String type,String fvalue);
	public List<AskDTO> askList_a(int cp, int ls,String type,String fvalue,String checklist);
	public int askCnt(String fvalue);
	public AskDTO askContent(int ask_idx);
	public boolean existsFile(String fileName);
	public int commentsInsert(CommentsDTO dto);
	public CommentsDTO commList(int ask_idx);
	public int deleteAsk(int ask_idx);
	public int deleteComm(int comm_idx);
}
