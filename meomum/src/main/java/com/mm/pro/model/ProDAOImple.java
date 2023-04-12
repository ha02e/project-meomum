package com.mm.pro.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class ProDAOImple implements ProDAO {

private SqlSessionTemplate sqlMap;
	
	
	public ProDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	
	//상품 등록
	@Override
	public int proInsert(ProDTO dto) {
		int count=sqlMap.insert("proInsert",dto);
		return count;
	}
	
	//페이징
	@Override
		public int getTotalCnt() {
			int count=sqlMap.selectOne("proTotalCnt");
			return count;
		}
	
	//상품 삭제
	@Override
		public int proDelete(int pro_idx) {
			int count=sqlMap.delete("proDelete",pro_idx);
			return count;
		}

	
	//상품 리스트 출력
		@Override
			public List<ProDTO> proList(Map map) {
				List<ProDTO> lists=sqlMap.selectList("proList", map);
				return lists;
			}
		
		
		
	//베스트인 척하는 pro_date asc순
	@Override
		public List<ProDTO> proBest() {
			List<ProDTO> lists=sqlMap.selectList("proBest");
			return lists;
		}
		
	
	//상품 검색
	@Override
		public List<ProDTO> proFind1(int proF) {
			List<ProDTO> lists=sqlMap.selectList("proFind1",proF);
			return lists;
		}
	
	//상품 검색2
	@Override
		public List<ProDTO> proFind2(String proF) {
			List<ProDTO> lists=sqlMap.selectList("proFind2",proF);
			return lists;
		}
	
	
	//상품 수정 리스트
	@Override
		public List<ProDTO> proUpdateList(int pro_idx) {
			List<ProDTO> lists=sqlMap.selectList("proUpdateList", pro_idx);
			return lists;
		}

	
	//상품 수정
	@Override
		public int proUpdate(ProDTO dto) {
		int count=sqlMap.update("proUpdate",dto);
		return count;
		}
	
	
	//상품 재고/상태 수정 시 조회
	@Override
		public ProDTO proSelect(int pro_idx) {
			ProDTO pdto=sqlMap.selectOne("proSelect", pro_idx);
			return pdto;
		}
	
	
	//상품 재고 수정
	@Override
		public int proAmountUpdate(ProDTO dto) {
			int count=sqlMap.update("proAmountUpdate", dto);
			return count;
		}
	
	
	//상품 상태 수정
	@Override
		public int proStateUpdate(ProDTO dto) {
			int count=sqlMap.update("proStateUpdate", dto);
			return count;
		}
	
	//배송처리 시 기존 상품재고 조회
	@Override
		public int proAmountSelect(int pro_idx) {
			int amount=sqlMap.selectOne("proAmountSelect", pro_idx);
			return amount;
		}	
	
	//배송처리 시 상품 재고 수정
	@Override
		public int proAmountShipUpdate(String order_idx) {
			int count=sqlMap.update("proAmountShipUpdate", order_idx);
			return count;
		}
	
	//파일 이름 찾기
	@Override
		public String proFindFile(Integer idx) {
		
		String result =  sqlMap.selectOne("proFindFile", idx);
		 
		return result;
		}
	
	
}
