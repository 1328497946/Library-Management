package entity;

public class bookrend {
	private String ser_num;
	private String reader_id;
	private String lend_date;
	private String should_back_time;
	private String back_date;
	private String book_id;
	private String timeout;
	private String timeout_days;
	public bookrend() {
		// TODO Auto-generated constructor stub
	}
	public String getReader_id() {
		return reader_id;
	}
	public void setReader_id(String reader_id) {
		this.reader_id = reader_id;
	}
	public String getLend_date() {
		return lend_date;
	}
	public void setLend_date(String lend_date) {
		this.lend_date = lend_date;
	}
	public String getShould_back_time() {
		return should_back_time;
	}
	public void setShould_back_time(String should_back_time) {
		this.should_back_time = should_back_time;
	}
	public String getBack_date() {
		return back_date;
	}
	public void setBack_date(String back_date) {
		this.back_date = back_date;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getTimeout() {
		return timeout;
	}
	public void setTimeout(String timeout) {
		this.timeout = timeout;
	}
	public String getTimeout_days() {
		return timeout_days;
	}
	public void setTimeout_days(String timeout_days) {
		this.timeout_days = timeout_days;
	}
	public String getSer_num() {
		return ser_num;
	}
	public void setSer_num(String ser_num) {
		this.ser_num = ser_num;
	}
	
}
