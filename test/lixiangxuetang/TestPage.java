package lixiangxuetang;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lxxt.po.Resource;
import com.lxxt.service.ResourceService;
import com.lxxt.utils.Page;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:config/applicationContext.xml")
public class TestPage {

	@Autowired
	ResourceService resourceService;
	
	@Test
	public void findPage(){
		Page<Resource> page = resourceService.findByPage(1);
		System.out.println(page.getCurrPage());
		System.out.println(page.getPageSize());
		System.out.println(page.getTotalCount());
		System.out.println(page.getTotalPage());
		List<Resource> resources = page.getLists();
		for (Resource resource : resources) {
			System.out.println(resource);
		}
		
	}
	

}
