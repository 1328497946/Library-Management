package javabean;

public class JavaBean {
		private double length;
		private double width;
		public JavaBean() {
			length = 20;
			width = 10;
		}
		public double getLength() {
			return length;
		}
		public void setLength(double length) {
			this.length = length;
		}
		public double getWidth() {
			return width;
		}
		public void setWidth(double width) {
			this.width = width;
		}
}