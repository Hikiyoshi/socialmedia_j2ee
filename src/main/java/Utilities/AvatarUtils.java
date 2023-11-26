package Utilities;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import Models.Profile;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class AvatarUtils {
	
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

		// Keep the old avatar if no file is submitted.
		if (submittedFile.length() == 0)
			return p.getImgAvatar();

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
}
