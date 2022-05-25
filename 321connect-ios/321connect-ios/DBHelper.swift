//
//  DBHelper.swift
//  321connect-ios
//
//  Created by Brianna Boston on 2/4/22.
//
 
import Foundation
import SQLite3
import UIKit
class DBHelper{
    
    init()
    {
    db = openDatabase()
    createTable()
 }
    let dbPath: String = "myDb.sqlite"
    var db:OpaquePointer?
    func openDatabase() -> OpaquePointer?
    {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
                        return nil
        }
        else {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    func createTable(){
        
        //Account Table_______________________________________________________________________________________________
        let createTableString = "CREATE TABLE IF NOT EXISTS Account(accountHolderId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,firstName TEXT,lastName TEXT,username TEXT, password TEXT,confirmPassword TEXT, phone TEXT);"
               var createTableStatement: OpaquePointer? = nil
               if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
               {
                   if sqlite3_step(createTableStatement) == SQLITE_DONE
                   {
                       print("Account table created.")
                   } else {
                       print("Account table could not be created.")
                   }
               } else {
                   print("CREATE TABLE statement could not be prepared.")
               }
        sqlite3_finalize(createTableStatement)
        
        //Child TABLE_______________________________________________________________________________________________
        let createTableString2 = "CREATE TABLE IF NOT EXISTS Child(childID INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT, gender TEXT, bloodType TEXT, dueDate INTEGER, birthday INTEGER, allergies TEXT, medications TEXT);"
        var createTableStatement2: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString2, -1, &createTableStatement2, nil) == SQLITE_OK {
           if sqlite3_step(createTableStatement2) == SQLITE_DONE
            {
               print("child table created")
           } else{
               print("child table could not be created.")
           }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement2)
        
        // Feed TABLE_______________________________________________________________________________________________
        let createTableString3 = "CREATE TABLE IF NOT EXISTS Feed(feedID INTEGER PRIMARY KEY, FOREIGN KEY(childID) REFERENCES Child(childID), amount INTEGER, substance TEXT, notes TEXT,foodUnit TEXT, entryTime INTEGER, iron TEXT, vitamin TEXT, eatMode TEXT);"
        var createTableStatement3: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString3, -1, &createTableStatement3, nil) == SQLITE_OK {
           if sqlite3_step(createTableStatement3) == SQLITE_DONE
            {
               print("feed table created")
           } else{
               print("childID table could not be created.")
           }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement3)
        
        // Mood TABLE_______________________________________________________________________________________________
        let createTableString4 = "CREATE TABLE IF NOT EXISTS Mood(moodID INTEGER PRIMARY KEY, FOREIGN KEY(childID) REFERENCES Child(childID), moodTyle TEXT, time TEXT,notes TEXT, units TEXT);"
        var createTableStatement4: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString4, -1, &createTableStatement4, nil) == SQLITE_OK {
           if sqlite3_step(createTableStatement4) == SQLITE_DONE
            {
               print("feed table created")
           } else{
               print("childID table could not be created.")
           }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement4)
        
        //Sleep TABLE_______________________________________________________________________________________________
        let createTableString5 = "CREATE TABLE IF NOT EXISTS Sleep(sleepID INTEGER PRIMARY KEY, FOREIGN KEY(childID) REFERENCES Child(childID), sleepTime INTEGER, duration INTEGER, snoring TEXT, medication TEXT, supplements TEXT, cPAP TEXT, other TEXT, study TEXT, unit TEXT, notes TEXT, sleepDate TEXT );"
        var createTableStatement5: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString5, -1, &createTableStatement5, nil) == SQLITE_OK {
           if sqlite3_step(createTableStatement5) == SQLITE_DONE
            {
               print("Sleep table created")
           } else{
               print("Sleep table could not be created.")
           }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement5)
        
        //ENTRY TABLE_______________________________________________________________________________________________
        let createTableString6 = "CREATE TABLE IF NOT EXISTS Entry(entryID INTEGER PRIMARY KEY, FOREIGN KEY(childID) REFERENCES Child(childID), entryText INTEGER, entryType TEXT, foreignID INTEGER);"
        var createTableStatement6: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString6, -1, &createTableStatement6, nil) == SQLITE_OK {
           if sqlite3_step(createTableStatement6) == SQLITE_DONE
            {
               print("Entry created")
           } else{
               print("Entry table could not be created.")
           }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement6)
        
        //MEDICAL TABLE_______________________________________________________________________________________________
        let createTableString7 = "CREATE TABLE IF NOT EXISTS Medical(medicalID INTEGER PRIMARY KEY, FOREIGN KEY(childID) REFERENCES Child(childID), height TEXT, weight TEXT, headSize TEXT, doctorVisit INTEGER, tempature INTEGER, provider TEXT, vistNum TEXT, providerType TEXT, checkAnswers TEXT, appointmentDates TEXT, appointmentProviders TEXT, notes TEXT);"
        var createTableStatement7: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString7, -1, &createTableStatement7, nil) == SQLITE_OK {
           if sqlite3_step(createTableStatement7) == SQLITE_DONE
            {
               print("Medical table created")
           } else{
               print("Medical table could not be created.")
           }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement7)
        
        //MileStone TABLE_______________________________________________________________________________________________
        let createTableString8 = "CREATE TABLE IF NOT EXISTS Milestone(mileStoneID INTEGER PRIMARY KEY, FOREIGN KEY(childID) REFERENCES Child(childID), height TEXT, weight TEXT, headSize TEXT, doctorVisit INTEGER, tempature INTEGER, provider TEXT, vistNum TEXT, providerType TEXT, checkAnswers TEXT, appointmentDates TEXT, appointmentProviders TEXT, notes TEXT);"
        var createTableStatement8: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString8, -1, &createTableStatement8, nil) == SQLITE_OK {
           if sqlite3_step(createTableStatement8) == SQLITE_DONE
            {
               print("Milestone table created")
           } else{
               print("Milestone table could not be created.")
           }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement8)
        
        
        //BATHROOM TABLE_______________________________________________________________________________________________
        let createTableString9 = "CREATE TABLE IF NOT EXISTS Bathroom(bathroomID INTEGER PRIMARY KEY, FOREIGN KEY(childID) REFERENCES Child(childID), bathroomType TEXT, treatment TEXT, leak TEXT, openAir INTEGER, diaperCream TEXT, quantity TEXT, pottyAccident TEXT, dateOfLastStool INTEGER, duration TEXT);"
       var createTableStatement9: OpaquePointer? = nil
       if sqlite3_prepare_v2(db, createTableString9, -1, &createTableStatement9, nil) == SQLITE_OK {
          if sqlite3_step(createTableStatement9) == SQLITE_DONE
           {
              print("bathroom table created")
          } else{
              print("bathroom table could not be created.")
          }
       } else {
           print("CREATE TABLE statement could not be prepared.")
       }
       sqlite3_finalize(createTableStatement9)
        
       //PROVIDER TABLE_______________________________________________________________________________________________
        let createTableString10 = "CREATE TABLE IF NOT EXISTS Provider(providerID INTEGER PRIMARY KEY, providerName TEXT, practiceName TEXT, specialty TEXT, fax TEXT, email TEXT, website TEXT, address TEXT, state TEXT);"
       var createTableStatement10: OpaquePointer? = nil
       if sqlite3_prepare_v2(db, createTableString10, -1, &createTableStatement10, nil) == SQLITE_OK {
          if sqlite3_step(createTableStatement10) == SQLITE_DONE
           {
              print("Provider table created")
          } else{
              print("Provider table could not be created.")
          }
       } else {
           print("CREATE TABLE statement could not be prepared.")
       }
       sqlite3_finalize(createTableStatement10)
        
        //Activity TABLE_______________________________________________________________________________________________
        let createTableString11 = "CREATE TABLE IF NOT EXISTS Activity(activityID INTEGER PRIMARY KEY,FOREIGN KEY(childID) REFERENCES Child(childID), activityName TEXT, entryTime INTEGER, duration TEXT, durationUnits TEXT, notes TEXT);"
       var createTableStatement11: OpaquePointer? = nil
       if sqlite3_prepare_v2(db, createTableString11, -1, &createTableStatement11, nil) == SQLITE_OK {
          if sqlite3_step(createTableStatement11) == SQLITE_DONE
           {
              print("Activity table created")
          } else{
              print("Activity table could not be created.")
          }
       } else {
           print("CREATE TABLE statement could not be prepared.")
       }
       sqlite3_finalize(createTableStatement11)
        
        //IMAGE TABLE_______________________________________________________________________________________________
        let createTableString12 = "CREATE TABLE IF NOT EXISTS Image(imageID INTEGER PRIMARY KEY,FOREIGN KEY(childID) REFERENCES Child(childID), image UIImage?);"
       var createTableStatement12: OpaquePointer? = nil
       if sqlite3_prepare_v2(db, createTableString12, -1, &createTableStatement12, nil) == SQLITE_OK {
          if sqlite3_step(createTableStatement12) == SQLITE_DONE
           {
              print("Image table created")
          } else{
              print("Image table could not be created.")
          }
       } else {
           print("CREATE TABLE statement could not be prepared.")
       }
       sqlite3_finalize(createTableStatement12)
        
       //Message:_______________________________________________________________________________________________
        let createTableString13 = "CREATE TABLE IF NOT EXISTS Message(messageID INTEGER PRIMARY KEY,FOREIGN KEY(childID) REFERENCES Child(childID, message TEXT);"
       var createTableStatement13: OpaquePointer? = nil
       if sqlite3_prepare_v2(db, createTableString13, -1, &createTableStatement13, nil) == SQLITE_OK {
          if sqlite3_step(createTableStatement13) == SQLITE_DONE
           {
              print("Message table created")
          } else{
              print("Message table could not be created.")
          }
       } else {
           print("CREATE TABLE statement could not be prepared.")
       }
       sqlite3_finalize(createTableStatement13)
        
        //Journal_______________________________________________________________________________________________
        let createTableString14 = "CREATE TABLE IF NOT EXISTS Journal(journalID INTEGER PRIMARY KEY,FOREIGN KEY(childID) REFERENCES Child(childID, title TEXT, notes TEXT);"
       var createTableStatement14: OpaquePointer? = nil
       if sqlite3_prepare_v2(db, createTableString14, -1, &createTableStatement14, nil) == SQLITE_OK {
          if sqlite3_step(createTableStatement14) == SQLITE_DONE
           {
              print("Journal table created")
          } else{
              print("Journal table could not be created.")
          }
       } else {
           print("CREATE TABLE statement could not be prepared.")
       }
       sqlite3_finalize(createTableStatement14)
        
        //MEDICATION _______________________________________________________________________________________________
        let createTableString15 = "CREATE TABLE IF NOT EXISTS Medication(medID INTEGER PRIMARY KEY,FOREIGN KEY(childID) REFERENCES Child(childID, medDosage INTEGER, medDosageUnits TEXT, medFrequency TEXT, medReason TEXT);"
       var createTableStatement15: OpaquePointer? = nil
       if sqlite3_prepare_v2(db, createTableString15, -1, &createTableStatement15, nil) == SQLITE_OK {
          if sqlite3_step(createTableStatement15) == SQLITE_DONE
           {
              print("Medication table created")
          } else{
              print("Medication table could not be created.")
          }
       } else {
           print("CREATE TABLE statement could not be prepared.")
       }
       sqlite3_finalize(createTableStatement15)
        
    }
    
    //INSERT FUNCTIONS
    
   //ACCOUNT INSERT_______________________________________________________________________________________________
    func accountInsert(accountHolderID:Int, firstName:String, lastName:String, userName:String, passWord:String, confirmPassword: String, phone:String )
        {
            
            let insertStatementString = "INSERT INTO Account (accountHolderID, firstName, lastName, userName, passWord, phone) VALUES (?, ?, ?, ?, ?, ?);"
            
            var insertStatement: OpaquePointer? = nil
            
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_int(insertStatement, 1, Int32(accountHolderID))
                sqlite3_bind_text(insertStatement, 2, (firstName as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, (lastName as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, (userName as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, (passWord as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 6, (confirmPassword as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 7, (phone as NSString).utf8String, -1, nil)
                
                // if/else statement checking and comparing string in password and confirmPW textfields
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                } else {
                    print("Could not insert row.")
                }
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
   
    //CHILD INSERT_______________________________________________________________________________________________
    func childInsert(childID:Int, firstName:String, lastName:String, gender:String, bloodType:String, dueDate:Int, birthday:Int, allergies:String, medications:String )
        {
            
            let insertStatementString = "INSERT INTO Child (childID, firstName, lastName, gender, bloodType, dueDate, birthday, allergies, medications) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_int(insertStatement, 1, Int32(childID))
                sqlite3_bind_text(insertStatement, 2, (firstName as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, (lastName as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, (gender as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, (bloodType as NSString).utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 6, Int32(dueDate))
                sqlite3_bind_int(insertStatement, 7, Int32(birthday))
                sqlite3_bind_text(insertStatement, 8, (allergies as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 9, (medications as NSString).utf8String, -1, nil)
                
                
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                } else {
                    print("Could not insert row.")
                }
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
    // FEED INSERT_______________________________________________________________________________________________
    func feedInsert(feedID:Int, childID:Int, amount:Int, substances:String, notes:String, foodUnit:String, entryTime:Int, iron:String, vitamin:String, eatMode:String )
        {
            
            let insertStatementString = "INSERT INTO Feed (feedID, childID, amount, substances, notes, foodUnit, entryTime, iron, vitamin, eatMode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_int(insertStatement, 1, Int32(feedID))
                sqlite3_bind_int(insertStatement, 2 , Int32(childID))
                sqlite3_bind_int(insertStatement, 3, Int32(amount))
                sqlite3_bind_text(insertStatement,4, (substances as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement,5, (notes as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement,6, (foodUnit as NSString).utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 7, Int32(entryTime))
                sqlite3_bind_text(insertStatement,8, (iron as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement,9, (vitamin as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement,10, (eatMode as NSString).utf8String, -1, nil)
                
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully Feedinserted row.")
                } else {
                    print("Could not Feedinsert row.")
                }
            } else {
                print("FEEDINSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
   
   //MOOD INSERT_______________________________________________________________________________________________
    func moodInsert(moodID:Int, childID:Int, moodType:String, time:String, notes:String, units:String)
        {
            
            let insertStatementString = "INSERT INTO Mood (moodID, childID, moodType, time, notes, units) VALUES (?, ?, ?, ?, ?, ?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_int(insertStatement, 1, Int32(moodID))
                sqlite3_bind_int(insertStatement, 2, Int32(childID))
                sqlite3_bind_text(insertStatement, 3, (moodType as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, (time as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, (notes as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 6, (units as NSString).utf8String, -1, nil)
             
                
                
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully Moodinserted row.")
                } else {
                    print("Could not insert row.")
                }
            } else {
                print("MoodINSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
   
   //SLEEP INSERT_______________________________________________________________________________________________
    func sleepInsert(sleepID:Int, childID:Int, sleepTime:String, duration:String, snoring:String, medication:String, supplements:String, allergies:String, medications:String, cPAP:String, other:String, study:String, unit:String, notes:String, sleepDate:String)
        {
            
            let insertStatementString = "INSERT INTO Sleep(sleepID, childID, sleepTime, duration, snoring, medication, supplements, allergies, medications, cPAP, other, study, unit, notes, sleepDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                
                sqlite3_bind_int(insertStatement, 1, Int32(sleepID))
                sqlite3_bind_int(insertStatement, 2, Int32(childID))
                sqlite3_bind_text(insertStatement, 3, (sleepTime as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, (duration as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, (snoring as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 6, (medication as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 7, (supplements as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 8, (allergies as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 9, (medications as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 10, (cPAP as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 11, (other as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 12, (study as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 13, (unit as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 14, (notes as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 15, (sleepDate as NSString).utf8String, -1, nil)
                
                
                
                
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                } else {
                    print("Could not SLEEPinsert row.")
                }
            } else {
                print("SLEEPINSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
   
    //Entry INSERT_______________________________________________________________________________________________
    func entryInsert(entryID:Int, childID:Int, entryText:Int, entryType:String, foreignID:Int )
        {
            
            let insertStatementString = "INSERT INTO Entry (entryID, childID, entryText, entryType, foreignID) VALUES (?, ?, ?, ?, ?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_int(insertStatement, 1, Int32(entryID))
                sqlite3_bind_int(insertStatement, 2, Int32(childID))
                sqlite3_bind_int(insertStatement, 3, Int32(entryText))
                sqlite3_bind_text(insertStatement, 4, (entryType as NSString).utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 5, Int32(foreignID))
                
                
                
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully ENTRYinserted row.")
                } else {
                    print("Could not ENTRYinsert row.")
                }
            } else {
                print("ENTRY INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
   
    
    // MEDICAL INSERT _______________________________________________________________________________________________
    func medicalInsert(medicalID:Int, childID:Int, height:String, weight:String, headSize:String, doctorsVisit:Int, temperature:String, provider:String, vistNum:String, providerType:String, checkAnswers: String, appointmentDates:String, appointmentProviders:String, notes:String )
        {
            
            let insertStatementString = "INSERT INTO Medical (medicalID, childID, height, weight, headSize, doctorsVisit, temperature, provider, vistNum, providerType, checkAnswers, appointmentDates, appointmentProviders, notes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_int(insertStatement, 1, Int32(medicalID))
                sqlite3_bind_int(insertStatement, 2, Int32(childID))
                sqlite3_bind_text(insertStatement, 3, (height as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, (weight as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, (headSize as NSString).utf8String, -1, nil)
                sqlite3_bind_int(insertStatement,  6, Int32(doctorsVisit))
                sqlite3_bind_text(insertStatement, 7, (temperature as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 8, (provider as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 9, (vistNum as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 10, (providerType as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 11, (checkAnswers as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 12, (appointmentDates as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 13, (appointmentProviders as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 14, (notes as NSString).utf8String, -1, nil)
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully Medical inserted row.")
                } else {
                    print("Could not insert row.")
                }
            } else {
                print("Medical INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
    
    
   //MILESTONEINSERT_______________________________________________________________________________________________
    func milestoneInsert(mileStoneID:Int,childID:Int,roll:String,walk:String,stand:String,sit:String,crawl:String,noHandWalk:String, jump:String, holds:String, handMouth:String, passes:String, pincher: String, drinks:String, scribbles:String, spoonFeed:String, points:String, emotion:String, affection:String, interest:String, coos:String, babbles:String, speaks:String, twoWords:String, sentence:String, startles:String, turns:String)
        {
            
            let insertStatementString = "INSERT INTO Milestone (mileStoneID,childID,roll,walk,stand,sit,crawl,noHandWalk, jump, holds, handMouth, passes, pincher, drinks, scribbles, spoonFeed, points, emotion, affection, interest, coos, babbles, speaks, twoWords, sentence, startles, turns) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_int(insertStatement, 1, Int32(mileStoneID))
                sqlite3_bind_int(insertStatement, 2, Int32(childID))
                sqlite3_bind_text(insertStatement, 3, (roll as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, (walk as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, (stand as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 6, (sit as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 7, (crawl as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 8, (noHandWalk as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 9, (jump as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 10, (holds as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 11, (handMouth as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 12, (passes as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 13, (pincher as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 14, (drinks as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 15, (scribbles as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 16, (spoonFeed as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 17, (points as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 18, (emotion as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 19, (affection as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 20, (interest as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 21, (coos as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 22, (babbles as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 23, (speaks as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 24, (twoWords as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 25, (sentence as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 26, (startles as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 27, (turns as NSString).utf8String, -1, nil)
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                } else {
                    print("Could not insert row.")
                }
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
    
    
   //BATHROOM INSERT_______________________________________________________________________________________________
    func bathroomInsert(bathRoomID:Int,childID:Int,bathroomType:String,treatment:String,leak:String,openAir:Int,diaperCream:String,quantity:String, pottyAccident:String, dateOfLastStool:Int, duration:String )
        {
            
            let insertStatementString = "INSERT INTO Bathroom (bathRoomID,childID,bathroomType,treatment,leak,openAir,diaperCream,quantity, pottyAccident, dateOfLastStool, duration) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_int(insertStatement, 1, Int32(bathRoomID))
                sqlite3_bind_int(insertStatement, 2, Int32(childID))
                sqlite3_bind_text(insertStatement, 3, (bathroomType as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, (treatment as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, (leak as NSString).utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 6, Int32(openAir))
                sqlite3_bind_text(insertStatement, 7, (diaperCream as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 8, (quantity as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 9, (pottyAccident as NSString).utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 10, Int32(dateOfLastStool))
                sqlite3_bind_text(insertStatement, 11, (duration as NSString).utf8String, -1, nil)
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                } else {
                    print("Could not insert row.")
                }
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
    
   //PROVIDER INSERT_______________________________________________________________________________________________
    func ProviderInsert(providerID:Int,providerName:String,practiceName:String,specialty:String,phone:String,fax:String,email:String, website:String, address:String, state:String, city:String, zip: String)
        {
            
            let insertStatementString = "INSERT INTO Child (providerID,providerName,practiceName,specialty,phone,fax,email, website, address, state, city, zip) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_int(insertStatement, 1, Int32(providerID))
                
                sqlite3_bind_text(insertStatement, 2, (providerName as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, (practiceName as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, (specialty as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, (phone as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 6, (fax as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 7, (email as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 8, (website as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 9, (address as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 10, (state as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 11, (city as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 12, (zip as NSString).utf8String, -1, nil)
                
                
                
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                } else {
                    print("Could not insert row.")
                }
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
    
    //ACTIVITY INSERT _______________________________________________________________________________________________
    func ActivityInsert(activityID:Int,childID:Int,activityName:String,entryTime:Int,duration:String,durationUnits:String,notes:String)
        {
            
            let insertStatementString = "INSERT INTO Activity (activityID,childID,activityName,entryTime,duration,durationUnits,notes) VALUES (?, ?, ?, ?, ?, ?, ?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_int(insertStatement, 1, Int32(activityID))
                sqlite3_bind_int(insertStatement, 2, Int32(childID))
                sqlite3_bind_text(insertStatement, 3, (activityName as NSString).utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 4, Int32(entryTime))
                sqlite3_bind_text(insertStatement, 5, (duration as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 6, (durationUnits as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 7, (notes as NSString).utf8String, -1, nil)
               
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                } else {
                    print("Could not insert row.")
                }
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
    
    //IMAGE INSERT_______________________________________________________________________________________________
    func ImageInsert(imageID:Int, childID:Int, image: UIImage?)
        {
            
            let insertStatementString = "INSERT INTO Child (imageID, childID, image) VALUES (?, ?, ?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_int(insertStatement, 1, Int32(imageID))
                sqlite3_bind_int(insertStatement, 2, Int32(childID))
//                sqlite3_bind_blob(insertStatement, 3, (imageID as blob).UIImage?, -1, nil)
                //IGNORE THIS ONE EDWARD I CANT FIGURE OUT WHY IT IS NOT WORKING
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                } else {
                    print("Could not insert row.")
                }
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
    
    //MESSAGE INSERT_______________________________________________________________________________________________
    func MessageInsert(messageID:Int, childID:Int, message:String)
        {
            
            let insertStatementString = "INSERT INTO Child (messageID, childID, message) VALUES (?, ?, ?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_int(insertStatement, 1, Int32(messageID))
                sqlite3_bind_int(insertStatement, 2, Int32(childID))
                sqlite3_bind_text(insertStatement, 3, (message as NSString).utf8String, -1, nil)
    
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                } else {
                    print("Could not insert row.")
                }
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
    
    //JOURNAL INSERT_______________________________________________________________________________________________
    func JournalInsert(journalID:Int,childID:Int,title:String, notes:String)
        {
            
            let insertStatementString = "INSERT INTO Child (journalID,childID,title, notes) VALUES (?, ?, ?, ?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_int(insertStatement, 1, Int32(journalID))
                sqlite3_bind_int(insertStatement, 2, Int32(childID))
                sqlite3_bind_text(insertStatement, 3, (title as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, (notes as NSString).utf8String, -1, nil)
            
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                } else {
                    print("Could not insert row.")
                }
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
    
    //MEDICATION INSERT _______________________________________________________________________________________________
    func MedicationInsert(medID:Int, childID:Int,medName:String, medDosage:Int, medDosageUnits:String,medFrequency:String, medReason:String)
        {
            
            let insertStatementString = "INSERT INTO Child (medID, childID,medName, medDosage, medDosageUnits,medFrequency, medReason) VALUES (?, ?, ?, ?, ?, ?, ?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_int(insertStatement, 1, Int32(medID))
                sqlite3_bind_int(insertStatement, 2, Int32(childID))
                sqlite3_bind_text(insertStatement, 3, (medName as NSString).utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 4, Int32(medDosage))
                sqlite3_bind_text(insertStatement, 5, (medDosageUnits as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 6, (medFrequency as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 7, (medReason as NSString).utf8String, -1, nil)
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                } else {
                    print("Could not insert row.")
                }
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
    
    
}
