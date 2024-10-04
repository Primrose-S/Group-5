from app import db
class company(db.Model):
    id = db.Column(db.Interger, primary_key = True)
    name = db.Column(db.String(300),nullable= False)
    website = db.Column(db.String(255), nullable=False)
    
    def __repr__(self):
        return f'<Company {self.name}>'
    
class Job(db.Model):

    id = db.Column(db.Interger, primary_key = True)
    title = db.Column(db.String(300),nullable= False)
    description = db.Column(db.Text, nullable= False)
    company_id = db.Column(db.interger, db.ForeignKey('company.id'), nullable=False)
    location =  db.Column(db.String(260), nullaable=False)
    posted_date = db.Column(db.DateTime, server_default=db.func.now())
    employment_type = db.Column(db.String(100), nullable=False)

    company = db.relationship('Company', backref='jpb')
     
    def __rept__(self):
        return f'<Job {self.title}>'
        
    
