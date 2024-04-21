import pyodbc
import qrcode
import time

try:
    # Establish connection to SQL Server database
    connection = pyodbc.connect('Driver={SQL Server};'
                                'Server=DESKTOP-O9RK00S\\SQLEXPRESS;'
                                'Database=bayar;'
                                'Trusted_Connection=yes;')
    cursor = connection.cursor()

    def generate_qr_code(data):
        # File name
        file_name = f"{data['First_Name']}_{data['Last_Name']}_qr.jpg"

        # Generate qr code
        qr_data = '\n'.join(f"{key}: {value}" for key, value in data.items())  # Join data with newline for QR code
        qr_img = qrcode.make(qr_data)

        # Save generated qr code as img
        qr_img.save(file_name)
        print(f"Generated QR code for {file_name}")

    def main():
        # Infinite loop to continuously monitor the database
        while True:
            try:
                # Join the tables and select all columns
                cursor.execute("""
                    SELECT *
                    FROM University u
                    JOIN College c ON u.Univ_ID = c.Univ_ID
                    JOIN Department d ON c.College_ID = d.College_ID
                    JOIN Enrollment e ON d.Dep_ID = e.Dep_ID
                    JOIN Student s ON e.Student_ID = s.Student_ID
                """)
                table_data = cursor.fetchall()

                # Process data from the joined tables
                for record in table_data:
                    student_data = {
                         "Student_ID": record.Student_ID,
                        "First_Name": record.First_Name,
                        "Last_Name": record.Last_Name,
                        "Gender": record.Gender,
                         "Date_Of_Birth": record.Date_Of_Birth,
                        "Email": record.Email,
                        "Phone_Number": record.Phone_Number,
                        "Enrol_ID": record.Enrol_ID,
                        "Enrollment_Date":record.Enrollment_Date,
                         "Grade": record.Grade,
                        "Image_Certificate": record.Image_Certificate,
                        "College_ID": record.College_ID,
                        "College_Name": record.College_Name,
                        "Dean": record.Dean,
                        "Univ_ID": record.Univ_ID,
                        "Univ_Name": record.Univ_Name,
                        "Adress": record.Adress
                        "P_Image": record.P_Image
                      
                        
                    }
                    generate_qr_code(student_data)

                # Wait for a certain period before checking again
                time.sleep(60)  # Check every minute

            except pyodbc.Error as e:
                print("An error occurred while fetching data from the database:", e)
                # Continue the loop even if an error occurs
                continue

    if __name__ == "__main__":
        main()

except pyodbc.Error as e:
    print("An error occurred while connecting to the database:", e)

    # Handle the error as appropriate
