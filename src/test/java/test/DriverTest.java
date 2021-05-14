package test;

import org.junit.jupiter.api.Test;

public class DriverTest {

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
