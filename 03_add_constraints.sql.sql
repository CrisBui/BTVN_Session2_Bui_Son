
-- THÊM RÀNG BUỘC KHÓA NGOẠI CHO SCHEMA: catalog

ALTER TABLE catalog.Books
    ADD CONSTRAINT
        FOREIGN KEY (category_id) REFERENCES catalog.Categories(category_id);

-- Nối từ bảng trung gian catalog.book_authors sang bảng gốc catalog.books
ALTER TABLE catalog.BookAuthors
    ADD CONSTRAINT
        FOREIGN KEY (book_id) REFERENCES catalog.Books(book_id);

-- Nối từ bảng trung gian catalog.book_authors sang bảng gốc catalog.authors
ALTER TABLE catalog.BookAuthors
    ADD CONSTRAINT
        FOREIGN KEY (author_id) REFERENCES catalog.Authors(author_id);

-- THÊM RÀNG BUỘC KHÓA NGOẠI CHO SCHEMA: operation

-- Nối từ operation.borrow_tickets sang operation.members (Mối quan hệ 1-N)
ALTER TABLE operation.BorrowTickets
    ADD CONSTRAINT
        FOREIGN KEY (member_id) REFERENCES operation.Members(member_id);

-- Nối từ bảng trung gian operation.ticket_details sang bảng gốc operation.borrow_tickets
ALTER TABLE operation.ticket_details
    ADD CONSTRAINT
        FOREIGN KEY (ticket_id) REFERENCES operation.BorrowTickets(ticket_id);

-- Nối xuyên Schema: Từ bảng trung gian operation.ticket_details sang bảng danh mục catalog.books
ALTER TABLE operation.TicketDetails
    ADD CONSTRAINT
        FOREIGN KEY (book_id) REFERENCES catalog.Books(book_id);