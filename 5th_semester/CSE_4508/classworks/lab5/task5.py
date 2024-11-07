import os
from sqlalchemy import create_engine, Column, Integer, String, Float
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

current_directory = os.path.dirname(os.path.abspath(__file__))
database_path = os.path.join(current_directory, 'example.db')

engine = create_engine(f'sqlite:///{database_path}')

Base = declarative_base()

class Book(Base):
    __tablename__ = 'books'  # Table name
    id = Column(Integer, primary_key=True)
    title = Column(String)
    author = Column(String)
    published_year = Column(Integer)
    price = Column(Float)

Base.metadata.create_all(engine)

Session = sessionmaker(bind=engine)
session = Session()

new_book = Book(id=1, title='The Great Gatesby', author='F. Scott Fitzgerald', published_year=1925, price=10.99)
session.add(new_book)
new_book = Book(id=2, title='To Kill a Mockingbird', author='Harper Lee', published_year=1960, price=7.99)
session.add(new_book)
new_book = Book(id=3, title='1984', author='George Orwell', published_year=1949, price=8.99)
session.add(new_book)
new_book = Book(id=4, title='Pride and Prejudice', author='Jane Austen', published_year=1812, price=5.99)
session.add(new_book)
new_book = Book(id=5, title='The Catcher in the Rye', author='J.D. Salinger', published_year=1951, price=6.99)
session.add(new_book)
session.commit()

print("-------All Books-------")
books = session.query(Book).all()
for book in books:
    print(f'id: {book.id}')
    print(f'title: {book.title}')
    print(f'author: {book.author}')
    print(f'published year: {book.published_year}')
    print(f'price: {book.price}')

book = session.query(Book).filter_by(title='The Great Gatesby').first()
book.price = 12.99
session.commit()

print("-------Query By Name-------")
book = session.query(Book).first()
# for book in books:
print(f'id: {book.id}')
print(f'title: {book.title}')
print(f'author: {book.author}')
print(f'published year: {book.published_year}')
print(f'price: {book.price}')

book = session.query(Book).filter_by(title='The Great Gatesby').first()
session.delete(book)
session.commit()

books = session.query(Book).all()
print("-------After Deletion-------")

# print(books.count())
for book in books:
    print(f'id: {book.id}')
    print(f'title: {book.title}')
    print(f'author: {book.author}')
    print(f'published year: {book.published_year}')
    print(f'price: {book.price}')