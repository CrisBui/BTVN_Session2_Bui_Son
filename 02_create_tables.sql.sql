
-- SCHEMA: catalog (Quản lý kho dữ liệu sách)


-- 1. Bảng Thể loại
CREATE TABLE catalog.Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- 2. Bảng Tác giả
CREATE TABLE catalog.Authors (
     author_id SERIAL PRIMARY KEY,
     author_name VARCHAR(100) NOT NULL,
     biography TEXT
);

-- 3. Bảng Sách
CREATE TABLE catalog.Books (
       book_id SERIAL PRIMARY KEY,
       isbn VARCHAR(20) NOT NULL UNIQUE,
       title VARCHAR(200) NOT NULL,
       published_year INTEGER CHECK (published_year <= EXTRACT(YEAR FROM CURRENT_DATE)),
       publisher VARCHAR(150),
       total_copies INTEGER NOT NULL CHECK (total_copies >= 0),
       available_copies INTEGER NOT NULL CHECK (available_copies >= 0),
       category_id INTEGER,
       CONSTRAINT chk_book_copies CHECK (available_copies <= total_copies)
);

-- 4. Bảng trung gian Sách - Tác giả (Giải quyết mối quan hệ Nhiều - Nhiều)
CREATE TABLE catalog.BookAuthors (
      book_id INTEGER,
      author_id INTEGER,
      PRIMARY KEY (book_id, author_id)
);


-- SCHEMA: operation (Quản lý vận hành và giao dịch)

-- 5. Bảng Thành viên
CREATE TABLE operation.Members (
       member_id SERIAL PRIMARY KEY,
       full_name VARCHAR(100) NOT NULL,
       email VARCHAR(100) NOT NULL UNIQUE,
       phone VARCHAR(15) NOT NULL,
       birth_date DATE CHECK (birth_date <= CURRENT_DATE - INTERVAL '18 years'), -- Ràng buộc thành viên phải trên 18 tuổi
       address TEXT,
       status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'inactive')),
       join_date DATE DEFAULT CURRENT_DATE
);

-- 6. Bảng Phiếu mượn
CREATE TABLE operation.BorrowTickets (
      ticket_id SERIAL PRIMARY KEY,
      member_id INTEGER,
      borrow_date DATE DEFAULT CURRENT_DATE,
      due_date DATE NOT NULL,
      actual_return_date DATE,
      CONSTRAINT chk_borrow_date CHECK (
          due_date >= borrow_date AND
          (actual_return_date IS NULL OR actual_return_date >= borrow_date)
          )
);

-- 7. Bảng Chi tiết phiếu mượn (Giải quyết mối quan hệ Nhiều - Nhiều giữa Phiếu mượn và Sách)
CREATE TABLE operation.TicketDetails (
      ticket_id INTEGER,
      book_id INTEGER,
      PRIMARY KEY (ticket_id, book_id)
);