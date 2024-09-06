-- Index for looking up students by ID or name
CREATE INDEX IF NOT EXISTS idx_students_id ON students(id);
CREATE INDEX IF NOT EXISTS idx_students_name ON students(name);

-- Index for looking up courses by department, number, semester, or title
CREATE INDEX IF NOT EXISTS idx_courses_department ON courses(department);
CREATE INDEX IF NOT EXISTS idx_courses_number ON courses(number);
CREATE INDEX IF NOT EXISTS idx_courses_semester ON courses(semester);
CREATE INDEX IF NOT EXISTS idx_courses_title ON courses(title);

-- Index for looking up enrollments by student_id or course_id
CREATE INDEX IF NOT EXISTS idx_enrollments_student_id ON enrollments(student_id);
CREATE INDEX IF NOT EXISTS idx_enrollments_course_id ON enrollments(course_id);

-- Index for looking up which courses satisfy a specific requirement
CREATE INDEX IF NOT EXISTS idx_satisfies_course_id ON satisfies(course_id);
CREATE INDEX IF NOT EXISTS idx_satisfies_requirement_id ON satisfies(requirement_id);
