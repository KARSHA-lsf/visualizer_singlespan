package org.karsha.visualizer;

import org.codehaus.jackson.map.annotate.JsonDeserialize;

/*
 * getter and setters
 * This is POJO object which models the edge between two node
 * source is source node index 
 * target is target node index
 * type is edge appeared time interval such "sustain","episodic","weak"
 * YEAR indicates this edge appeared in year or available in relevant year
 * status is which contains edge faked edge or true edge fake edges for incomplete triad edge
 * inedge indicates this edge is incoming edge for incomplete triad nodes
 * */
public class Links{
	
	int source;
	int target;
	
	boolean status;
	boolean inedge;
		
	public int getSource() {
		return source;
	}
	public void setSource(int source) {
		this.source = source;
	}
	public int getTarget() {
		return target;
	}
	public void setTarget(int target) {
		this.target = target;
	}
	
	
}
