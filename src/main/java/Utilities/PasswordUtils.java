package Utilities;

import java.util.regex.Pattern;

public class PasswordUtils {
	/* Invalid password is:
	 *  - Less than 8 characters.
	 *  - Or doesn't contain any numbers.
	 *  - Or doesn't contain any uppercase letters.
	 *  - Or doesn't contain any lowercase letters.
	 *  - Or doesn't contain any special characters.
	 */
	private static Pattern _invalidPattern =
				   Pattern.compile("^(.{0,7}|[^0-9]*|[^A-Z]*|[^a-z]*|[a-zA-Z0-9]*)$");
	
	public static boolean isValid(String password) {
		return !_invalidPattern.matcher(password).matches();
	}
}
