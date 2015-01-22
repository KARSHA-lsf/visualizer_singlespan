package org.lsflbas.Reader;

import java.io.FileNotFoundException;
import java.io.IOException;

public class Reader {
	
	public static void main(String[] args) throws IOException {
		
		 	String filepath="node.csv";
		 	
		 	int year=4,j=2005; //2005 =4 , 2005 = 9
		 	
		 	String overall="original.csv";
		 	
		 	Edge e=new Edge();
		 	e.Nodes(filepath);
		 	
		 		e.logic(overall,year,"weekly.csv");
		 		
		
		 	
		 	//e.EdgeReader(yearly,quartely,writepath);
		 	//System.out.println(eTime-sTime);
	}	

}
