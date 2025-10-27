using System;
using System.Security.Cryptography;
using System.Text;

namespace WebApplication5.Utilities
{
    public static class PasswordEncoder
    {
        // Using PBKDF2 with SHA-256 for password hashing
        private const int SaltSize = 32; // 32 bytes = 256 bits
        private const int HashSize = 32; // 32 bytes = 256 bits
        private const int Iterations = 10000; // Number of iterations for PBKDF2

        /// <summary>
        /// Hashes a password with a randomly generated salt
        /// </summary>
        /// <param name="password">The plain text password to hash</param>
        /// <returns>A string containing the salt and hash separated by a colon</returns>
        public static string HashPassword(string password)
        {
            if (string.IsNullOrEmpty(password))
                throw new ArgumentException("Password cannot be null or empty", nameof(password));

            // Generate a random salt
            byte[] salt = new byte[SaltSize];
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(salt);
            }

            // Hash the password with the salt
            byte[] hash = ComputeHash(password, salt);

            // Combine salt and hash for storage
            string saltBase64 = Convert.ToBase64String(salt);
            string hashBase64 = Convert.ToBase64String(hash);

            return $"{saltBase64}:{hashBase64}";
        }

        /// <summary>
        /// Verifies a password against a stored hash
        /// </summary>
        /// <param name="password">The plain text password to verify</param>
        /// <param name="storedHash">The stored hash in format "salt:hash"</param>
        /// <returns>True if the password matches the hash, false otherwise</returns>
        public static bool VerifyPassword(string password, string storedHash)
        {
            if (string.IsNullOrEmpty(password) || string.IsNullOrEmpty(storedHash))
                return false;

            string[] parts = storedHash.Split(':');
            if (parts.Length != 2)
                return false;

            byte[] salt = Convert.FromBase64String(parts[0]);
            byte[] storedHashBytes = Convert.FromBase64String(parts[1]);

            byte[] computedHash = ComputeHash(password, salt);

            // Compare hashes in a timing-attack-resistant way
            return SlowEquals(computedHash, storedHashBytes);
        }

        /// <summary>
        /// Computes the hash of a password with the given salt using PBKDF2
        /// </summary>
        /// <param name="password">The password to hash</param>
        /// <param name="salt">The salt to use for hashing</param>
        /// <returns>The computed hash as a byte array</returns>
        private static byte[] ComputeHash(string password, byte[] salt)
        {
            using (var pbkdf2 = new Rfc2898DeriveBytes(password, salt, Iterations, HashAlgorithmName.SHA256))
            {
                return pbkdf2.GetBytes(HashSize);
            }
        }

        /// <summary>
        /// Performs a constant-time comparison of two byte arrays to prevent timing attacks
        /// </summary>
        /// <param name="a">First byte array</param>
        /// <param name="b">Second byte array</param>
        /// <returns>True if both arrays are equal, false otherwise</returns>
        private static bool SlowEquals(byte[] a, byte[] b)
        {
            if (a == null || b == null || a.Length != b.Length)
                return false;

            uint diff = 0;
            for (int i = 0; i < a.Length; i++)
            {
                diff |= (uint)(a[i] ^ b[i]);
            }
            return diff == 0;
        }
    }
}