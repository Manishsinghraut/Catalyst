package com.lucernex.qa.utils;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.StringUtils;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.KeySpec;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.google.common.base.Preconditions.checkArgument;

public class TripleDesCipher {
    /** DESede is triple DES cipher. */
    public static final String DESEDE_ENCRYPTION_SCHEME = "DESede";

    private Pattern desPattern = Pattern.compile("^DES:([^\\s]+)\\s*$");
    private KeySpec keySpec;
    private SecretKeyFactory keyFactory;
    private Cipher cipher;

    /**
     * Returns a base64 encoding and triple des encrypted equivalent of a
     * specified plaintext string.
     *
     * @param plaintext - unencrypted string
     */
    public String encrypt(String plaintext) throws EncryptionException {
        checkArgument(plaintext != null, "Required argument 'plaintext' was null!");

        plaintext = plaintext.trim();

        checkArgument(!plaintext.isEmpty(), "Required argument 'plaintext' was empty string!");

        try {
            SecretKey key = keyFactory.generateSecret(keySpec);
            
            cipher.init(Cipher.ENCRYPT_MODE, key);
            
            byte[]  cleartext = StringUtils.getBytesUtf16(plaintext);
            byte[] ciphertext = cipher.doFinal(cleartext);

            return Base64.encodeBase64String(ciphertext);

        } catch (Exception e) {
            throw new EncryptionException(e);
        }

    }

    /**
     * Returns plaintext equivalent of a specified base64 encoded and encrypted
     * string.
     *
     * @param encrypted - base64 encoded and triple des encrypted string
     */
    public String decrypt(String encrypted) throws EncryptionException {
        checkArgument(encrypted != null, "Required argument 'encrypted' was null!");

        encrypted = encrypted.trim();

        checkArgument(!encrypted.isEmpty(), "Required argument 'encrypted' was empty string!");

        try {
            SecretKey key = keyFactory.generateSecret(keySpec);
            
            cipher.init(Cipher.DECRYPT_MODE, key);

            byte[]  cleartext = Base64.decodeBase64(encrypted);
            byte[] ciphertext = cipher.doFinal(cleartext);

            return StringUtils.newStringUtf16(ciphertext);
        } catch (Exception e) {
            throw new EncryptionException(e);
        }
    }



    /**
     * Returns plaintext equivalent of a specified base64 encoded and encrypted
     * string if it is prefixed by 'DES:', otherwise returns specified string.
     *
     * @param encrypted - potentially encrypted string (if prefixed by 'DES:')
     */
    public String decryptIfPrefixed(String encrypted) throws EncryptionException {
        Matcher m = desPattern.matcher(encrypted);

        if (m.matches()) {
            return decrypt(m.group(1));
        } else {
            return encrypted;
        }
    }

    /**
     * Creates instance given encryption key.
     * 
     * @param encryptionKey triple DES encryption key which must be at least 24 chars
     */
    public TripleDesCipher(String encryptionKey) throws EncryptionException {
        checkArgument(encryptionKey != null, "Required argument 'encryptionKey' was null!");

        encryptionKey = encryptionKey.trim();

        checkArgument(encryptionKey.length() >= 24 , "Encryption key was less than 24 characters!");

        try {
            byte[] keyAsBytes = StringUtils.getBytesUtf16(encryptionKey);
            
            keySpec    = new DESedeKeySpec(keyAsBytes);
            keyFactory = SecretKeyFactory.getInstance(DESEDE_ENCRYPTION_SCHEME);
            cipher     = Cipher.getInstance(DESEDE_ENCRYPTION_SCHEME);
        } catch (InvalidKeyException e) {
            throw new EncryptionException( e );
        } catch (NoSuchAlgorithmException e) {
            throw new EncryptionException( e );
        } catch (NoSuchPaddingException e) {
            throw new EncryptionException( e );
        }
    }

    /**
     * Default constructor. 
     */
    public TripleDesCipher() throws EncryptionException {
        this("8751c6e0cb4f11db879fd0e666e5d8808751c6e0cb4f11db87a0d0e666e5d8808751c6e0cb4f11db87a1d0e666e5d8808751c6e0cb4f11db");
    }

    public static void main(String[] args) throws EncryptionException {
        if (args.length == 0) {
            System.out.println("Usage: plaintext");
            System.out.println("Will return encrypted equivalent of specified 'plaintext'.");
            System.exit(0);
        }

        String password = args[0];

        if (password.startsWith("DES:")) {
            System.out.println((new TripleDesCipher()).decryptIfPrefixed(password));
        } else {
            System.out.println("DES:" + (new TripleDesCipher()).encrypt(password));
        }
    }
}
