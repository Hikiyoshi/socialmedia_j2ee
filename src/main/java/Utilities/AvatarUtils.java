package Utilities;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import Models.Profile;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class AvatarUtils {
	
	private final static String[] SUPPORTED_EXTENSIONS = {"png", "jfif", "pjpeg", "jpeg", "pjp", "jpg", "bmp", "dib"};
	private static Pattern _namePattern = Pattern.compile("[a-zA-Z0-9_]+[.]" + String.join("|", SUPPORTED_EXTENSIONS));
	
	// Change the external storage path if you want to.
	private static final File EXTERNAL_STORAGE_DIR = new File("D:/User Avatars");

	/**
	 * Saves this uploaded avatar image file to an external storage, so that it can be deployed 
	 * if the servlet is republished or reloaded.
	 * @param request The sent request.
	 * @param p The profile using this new avatar.
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public static String writeAvatarToDisk(HttpServletRequest request, Profile p) throws ServletException, IOException {
		String deployDir = request.getServletContext().getRealPath("/images");

		if (!EXTERNAL_STORAGE_DIR.exists()) {
			EXTERNAL_STORAGE_DIR.mkdirs();
		}

		Part avatarInput = request.getPart("avatarInput");

		String submittedFile = avatarInput.getSubmittedFileName();
		String oldAvatar = p.getImgAvatar();

		// Keep the old avatar if no file is submitted.
		// Or if the submitted file isn't an image file.
		if (submittedFile.length() == 0 || !isValidType(submittedFile)) {			
			if (isValidType(oldAvatar) && !oldAvatar.equalsIgnoreCase("avatar_default.png"))
				return oldAvatar;
				
			return "avatar_default.png";
		}		

		String extension = avatarInput.getSubmittedFileName().split("[.]")[1];
		String fileName = String.format("avatar_%s.%s", p.getUsername(), extension);

		File externalFile = new File(EXTERNAL_STORAGE_DIR, fileName);
		File deployFile = new File(deployDir, fileName);

		// Store an additional copy outside the servlet's deployment folder.
		try (InputStream inputStream = avatarInput.getInputStream()) {
			Files.copy(inputStream, externalFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
		}

		// Save the file to the deployment folder.
		try (InputStream inputStream = avatarInput.getInputStream()) {
			Files.copy(inputStream, deployFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
		}

		return fileName;
	}

	/**
	 * Checks to see if this avatar exists on the servlet.
	 * @param request The sent request.
	 * @param avatarFile The avatar file to check.
	 * @return The original avatar passed in if exists, otherwise uses the default avatar. 
	 * @throws ServletException
	 * @throws IOException
	 */
	public static String verifyAvatarDeployment(HttpServletRequest request, String avatarFile) throws ServletException, IOException {
		String deployDir = request.getServletContext().getRealPath("/images");
		File avatar = new File(deployDir, avatarFile);

		if (!isValidType(avatarFile))
			return "avatar_default.png";
		
		System.out.println("Avatar name is valid!");
		System.out.println("Avatar exists: " + avatar.exists());
		
		if (!avatar.exists()) {
			// Try re-deploying all the avatars to see if this avatar exists.
			System.out.println("Missing certain avatars in the servlet deployment path, re-deploying avatars...");
			deployAvatars(deployDir);
			
			// If still doesn't exist after deploying, use the default avatar.
			if (!avatar.exists())
				return "avatar_default.png";
		} else {
			System.out.println("All avatars are verified and deployed!");
		}
		
		// Return the original avatar if it was found after re-deploying.
		return avatarFile;
	}

	private static void deployAvatars(String deployDir) throws IOException {
		System.out.println(String.format("Deploying avatars from [%s]...", EXTERNAL_STORAGE_DIR.getPath()));

		if (EXTERNAL_STORAGE_DIR.exists())
			for (File fileToDeploy : EXTERNAL_STORAGE_DIR.listFiles())
				if (fileToDeploy.isFile()) {
					File deployFile = new File(deployDir, fileToDeploy.getName());
					Files.copy(fileToDeploy.toPath(), deployFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
				}

		System.out.println("Deployment complete!");
	}
	
	private static boolean isValidType(String fileName) {
		return _namePattern.matcher(fileName).matches();
	}
}
