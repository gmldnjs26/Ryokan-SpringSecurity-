package com.gwak;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.gwak.mapper.ReserveMapper;

import utils.ReserveJoinVO;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RyoKanApplicationTests {
	@Autowired
	ReserveMapper reserveMapper;
	

	@Test
	public void contextLoads() {
	}
	@Test
	public void arrayListTest() {
		List<ReserveJoinVO>list = reserveMapper.getReserveJoinList();
		
		System.out.println(list.get(0).getPaymentVO().getP_date());
	}
	

}
