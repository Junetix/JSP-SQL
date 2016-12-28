package sungjuk;

public class SungjukDataBean {
	String hakbun;
	String irum;
	int kor;
	int eng;
	int math;
	int tot;
	double avg;
	String grade;
	public String getHakbun() {
		return hakbun;
	}
	public String getIrum() {
		return irum;
	}
	public int getKor() {
		return kor;
	}
	public int getEng() {
		return eng;
	}
	public int getMath() {
		
		return math;
	}
	public int getTot() {
		return tot;
	}
	public double getAvg() {
		return avg;
	}
	public String getGrade() {
		return grade;
	}
	public void setHakbun(String hakbun) {
		this.hakbun = hakbun;
	}
	public void setIrum(String irum) {
		this.irum = irum;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public void setMath(int math) {
		
		this.math = math;
	}
	public void setTot(int tot){ 
		 this.tot=tot;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public void setTot(){
		this.tot = kor+eng+math;
		setAvg();
	}
	public void setAvg(){
		this.avg = tot/3.;
		setGrade();
	}
	public void setGrade(){
		switch((int)(avg/10)){
		case 10:
		case 9:
			this.grade="수";
			break;
		case 8:
			this.grade="우";
			break;
		case 7:
			this.grade="미";
			break;
		case 6:
			this.grade="양";
			break;
		case 5:
			this.grade="가";
			break;	
		
		}
		
	}
}
