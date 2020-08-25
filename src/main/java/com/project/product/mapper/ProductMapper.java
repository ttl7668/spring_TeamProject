 package com.project.product.mapper;

import java.util.List;

import com.project.product.vo.EnrollVO;
import com.project.product.vo.ProductResultVO;
import com.project.product.vo.ProductVO;

public interface ProductMapper {
   
   public int ProductRegist(ProductVO vo);
   public ProductResultVO getProductInfo(int pno);
   public int ProductGetNextPno();
   
   public List<ProductResultVO> getAllProductList();
   
   public int EnrollProduct(EnrollVO enrollVO);

}