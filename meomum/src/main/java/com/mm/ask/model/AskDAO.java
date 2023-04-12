package com.mm.ask.model;

import java.util.List;



public interface AskDAO {
	public int askInsert(AskDTO dto);
	public List<AskDTO> askList(int cp, int ls,String type,String fvalue);
	public List<AskDTO> askList_a(int cp, int ls,String type,String fvalue,String checklist);
	public int askCnt(String fvalue);
	public int askCnt_a(String fvalue,String checklist);
	public AskDTO askContent(int ask_idx);
	public boolean existsFile(String fileName);
	public int commentsInsert(CommentsDTO dto);
	public CommentsDTO commList(int ask_idx);
	public int deleteAsk(int ask_idx);
	public int deleteComm(int comm_idx);
	public List<AskDTO> myaskList(int cp, int ls,int user_idx);

	public int myaskCnt(int user_idx);

}
