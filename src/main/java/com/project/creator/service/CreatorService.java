package com.project.creator.service;

import java.util.ArrayList;
import java.util.List;

import com.project.creator.vo.EnrollBoardVO;
import com.project.product.vo.ProductResultVO;
import com.project.product.vo.ProductVO;

public interface CreatorService {
	
	public int getMaxEno();
	public int insertEnrollBoard(EnrollBoardVO enrollBoardVO);
	
	public List<EnrollBoardVO> getEnrollList(String pno);
	
	public EnrollBoardVO getEnrollDetailBoard(String eno, String pno);
	public List<ProductVO> getUserProductList(int uno);
	
	public int IsCreator(int uno);
	
}
