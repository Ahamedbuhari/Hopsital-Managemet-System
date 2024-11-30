
-- 1. Retrieve the names and genders of all patients.
	  SELECT patient_name, gender FROM patients
      
-- 2. List the unique diagnoses recorded in the medical records.
	  SELECT DISTINCT diagnosis FROM medicalrecords
      
 --  3. Count the total number of patients in the database.
        SELECT Count(*) FROM patients
--   4. Find the oldest patient in the database.
         SELECT patient_name, date_of_birth FROM patients
         ORDER BY date_of_birth
         LIMIT 3
		 
-- 5)  Display the address and phone number of the patient with ID 7
        SELECT address, phone_number from patients
        WHERE patient_id = 7
        
-- 6)  Retrieve the names and specializations of all doctors.
        SELECT doctor_name, specialization FROM doctors
        
-- 7) Calculate the average length of hospital stay for all patients
        SELECT AVG(DATEDIFF(discharge_date, admission_date)) AS average_stay FROM medicalrecords
        
-- 8)Count the male and female patients separately
      SELECT gender, Count(*) as Total_Count from patients
      GROUP BY gender
 -- 9)Find the doctor who treated the most patients
        SELECT doctor_id, COUNT(*) AS patient_count
        FROM MedicalRecords
        GROUP BY doctor_id
        ORDER BY patient_count DESC
         LIMIT 1;
     
-- 10) List all the patients with starting with j
      select * from patients
      where patient_name LIKE "J%"
 
 -- Medium Level Questions:
-- 11) Retrieve the names of patients along with their admission and discharge dates
      SELECT p.patient_name, m.admission_date, m.discharge_date
       FROM patients p
       INNER JOIN medicalrecords m
       ON p.patient_id = m.patient_id

-- 12) Calculate the total number of medical records in the database
       SELECT COUNT(*) as medicalrecords from medicalrecords
       
-- 13) List the patients who were diagnosed with hypertension or diabetes

      SELECT p.patient_name, m.diagnosis 
      FROM patients p
      JOIN medicalrecords m ON p.patient_id = m.patient_id
	  WHERE diagnosis IN ('Hypertension', 'Diabetes')
  
  -- 14) Find the average age of patients in the database
        SELECT AVG(YEAR(CURRENT_DATE)- YEAR(date_of_birth)) as AVG_AGE
        from patients
 
 -- 15) Display the doctors who treated patients admitted in January 2023.
        SELECT DISTINCT d.* FROM doctors d
        JOIN medicalrecords m ON d.doctor_id= m.doctor_id
        WHERE YEAR(m.admission_date) = 2023 AND MONTH(m.admission_date) = 1
 
-- 16 )Calculate the total number of patients treated by each doctor.
        SELECT  doctor_id, COUNT(*) AS total_patients From medicalrecords
        GROUP BY doctor_id
        limit 8
      
-- 17 )List the patients who were treated by doctors specializing in Cardiology.
        SELECT p.* FROM patients p
        JOIN medicalrecords m ON p.patient_id = m. patient_id
        JOIN Doctors d ON m.doctor_id = d.doctor_id
        wHERE d.specialization = "Cardiology"
       
      
-- 18)  Find the patient with the longest hospital stay duration.
         SELECT p.*
         FROM Patients p
		 INNER JOIN MedicalRecords m ON p.patient_id = m.patient_id
         ORDER BY DATEDIFF(m.discharge_date, m.admission_date) DESC
         LIMIT 1;
         
-- 19 )    Display the top 5 most common diagnoses recorded in the medical records.
                
          select diagnosis, count(*) as count FROM medicalrecords
          GROUP BY diagnosis
          ORDER BY count DESC
          LIMIT 5
          

-- 20)  List the patients who were treated by doctors with names starting with 'Dr. S'

		SELECT p.* FROM Patients p
        INNER JOIN MedicalRecords m ON p.patient_id = m.patient_id
        INNER JOIN Doctors d ON m.doctor_id = d.doctor_id
        WHERE d.doctor_name LIKE 'Dr. S%';


-- 21)Calculate the percentage of male and female patients in the database.
     SELECT gender, COUNT(*) * 100 / (SELECT COUNT(*)  FROM patients) as Percentage
     FROM patients
     GROUP BY gender
     
-- 22) Find the patient with the highest number of medical records.
      SELECT patient_id, COUNT(*) AS record_count 
      FROM medicalrecords 
      GROUP BY patient_id
      ORDER BY record_count DESC
      LIMIT 1

-- 23)  List the top 3 doctors who treated the most patients.
       SELECT doctor_id, COUNT(*) AS patients_count 
       FROM medicalrecords
       GROUP BY doctor_id
       ORDER BY patients_count desc
       LIMIT 3

-- 25) Calculate the average length of hospital stay for each diagnosis.
       SELECT diagnosis,AVG(DATEDIFF(discharge_date, admission_date)) AS avg_length_of_stay
	   FROM medicalrecords
       GROUP BY diagnosis
















 