package egovframework.com.nexa.common.domain;

import java.io.Serializable;
import java.util.Map;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

@SuppressWarnings("unchecked")
public class BaseObject implements Serializable {

	private static final long serialVersionUID = -5034695928223585363L;

	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	public boolean equals(Object o) {
		return EqualsBuilder.reflectionEquals(this, o);
	}

	public int hashCode() {
		return HashCodeBuilder.reflectionHashCode(this);
	}
	
	private Map reqMap;
	private User user;

	public void setReqMap(Map reqMap) {
		if(reqMap != null){
			setUser((User)reqMap.get("User"));
		}
		this.reqMap = reqMap;
	}

	public Map getReqMap() {
		return reqMap;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	
}