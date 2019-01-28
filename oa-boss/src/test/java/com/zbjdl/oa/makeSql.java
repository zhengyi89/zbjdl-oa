package com.zbjdl.oa;

import java.util.ArrayList;

public class makeSql {

	public static void main(String[] args) {

		//生成对外管理员角色和功能点关联的SQL
		int[] adminRole = { 3999, 56, 77, 93, 118, 134, 151, 169, 191, 220, 234, 243, 245, 248, 256, 258, 264, 267, 269 };
		for (int i = 0; i < adminRole.length; i++) {
				String adminRoleSQL = "INSERT INTO `tbl_roleandfunctionrelation`(ROLEID,FUNCTIONID) VALUES"
						+"("+adminRole[i]+",'-99910091')," 
						+"("+adminRole[i]+",'-99910090')," 
						+"("+adminRole[i]+",'-900028')," 
						+"("+adminRole[i]+",'-900027')," 
						+"("+adminRole[i]+",'-900026')," 
						+"("+adminRole[i]+",'-900025')," 
						+"("+adminRole[i]+",'-900024')," 
						+"("+adminRole[i]+",'-900023')," 
						+"("+adminRole[i]+",'-900022')," 
						+"("+adminRole[i]+",'-900021')," 
						+"("+adminRole[i]+",'-900020')," 
						+"("+adminRole[i]+",'-900019')," 
						+"("+adminRole[i]+",'-900018')," 
						+"("+adminRole[i]+",'-900002');" ;
//				System.out.println(adminRoleSQL);

		}
		//生成支行角色和功能点关联的SQL
		for(int k = 40;k<=270;k++){
				
			String generalRoleSQL = "INSERT INTO `tbl_roleandfunctionrelation`(ROLEID,FUNCTIONID) VALUES"
					+"("+k+",'-99910090')," 
					+"("+k+",'-900042')," 
					+"("+k+",'-900041')," 
					+"("+k+",'-900038')," 
					+"("+k+",'-900006')," 
					+"("+k+",'-900002');";
			System.out.println(generalRoleSQL);
		}

		// TODO Auto-generated method stub

	}

}
