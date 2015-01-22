package org.lsflbas.Reader;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
import java.util.Vector;

import javax.management.remote.TargetedNotification;

/*nodes csv reader method*/

public class Edge {

	public String[][] dataset = new String[52][3];
	
	String id;

	public void Nodes(String path) {

		try {

			File f = new File(path);
			Scanner sc = new Scanner(f);
			int countLine = 0;

			while (sc.hasNextLine()) {

				String line = sc.nextLine();
				String[] arr = line.split(",");

				if (arr.length == 3) {
					dataset[countLine][0] = arr[0];// group
					dataset[countLine][1] = arr[1];// id
					dataset[countLine][2] = arr[2];// name
					countLine++;
				}

			}
			//System.out.println(dataset[0][2]);
			sc.close();

			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void logic(String overall,int year,String filenm) {

		try {

			File f = new File(overall);
			File fw= new File(filenm);
			FileWriter fww = new FileWriter(fw);
			BufferedWriter bw = new BufferedWriter(fww);
			Scanner sc = new Scanner(f);
			int countLine = 0;
			int source = -1,target=-1; 
			String sentence = null;
			bw.write("source,target\n");
			while (sc.hasNextLine()) {

				String line = sc.nextLine();
				//System.out.println(line);
				String[] arr = line.split(",");
				
				for (int i = 0; i < dataset.length; i++) {
					if(arr[0].equals(dataset[i][1])){
						source = i;
					}
				}
				for (int i = 0; i < dataset.length; i++) {
					if(arr[2].equals(dataset[i][1])){
						target = i;
					}
				}
				
				//bond.11,AgNatRes,bond.31,ManEdible,FALSE,FALSE,FALSE,
				sentence = source+","+target;
				System.out.println(sentence);
				//if(!type_find(year, arr).equalsIgnoreCase("false")){
					bw.write(sentence+"\n");
					//System.out.println(sentence);
				//}
		
				
			}
			sc.close();
			bw.close();
		

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String con(String a){
		if(a.equalsIgnoreCase("FALSE"))return "0";
		else return "1";
	}
	
	public static String type_find (int pos, String arr[]){
		
		String group = null;
		if(arr[pos].equals("FALSE")){
			if(arr[pos+1].equals("FALSE")&arr[pos+2].equals("FALSE")&arr[pos+3].equals("FALSE")&arr[pos+4].equals("FALSE")){
				group = "false";
			}else{
				group = "episodic";
			}
		}else{
			if(arr[pos+1].equals("FALSE")&arr[pos+2].equals("FALSE")&arr[pos+3].equals("FALSE")&arr[pos+4].equals("FALSE")){
				group = "week";
			}else{
				if((arr[pos+1].equals("TRUE")&arr[pos+2].equals("TRUE"))|(arr[pos+2].equals("TRUE")&arr[pos+3].equals("TRUE"))|(arr[pos+3].equals("TRUE")&arr[pos+4].equals("TRUE"))){
					group = "sustained";
				}else{
					group = "episodic";
				}
			}
		}
		return group;
	}

}