import os
from sqlalchemy import create_engine, Column, Integer, String, Float
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Connecting to an SQLite database (or creating it if it doesn’t exist)
current_directory = os.path.dirname(os.path.abspath(__file__))
database_path = os.path.join(current_directory, 'example.db')  # Corrected file name

# Initialize database engine
engine = create_engine(f'sqlite:///{database_path}')

Base = declarative_base()

# Define the Book class
class Book(Base):
    __tablename__ = 'books'  # Table name
    id = Column(Integer, primary_key=True)
    title = Column(String)
    author = Column(String)
    published_year = Column(Integer)
    price = Column(Float)

# Create all tables defined with Base
Base.metadata.create_all(engine)

# Initialize session
Session = sessionmaker(bind=engine)
session = Session()
