# Name:   Teagan Clark
# ID:     10767557
# Date:   12/6/2023
# Course: CSC115_02
# Lab06:  StepsAverageReader

# print welcome message
print("""This program calculates the average number of steps
taken in each month using the data from the file steps.txt
""")

def main():
    # open file
    steps_file = open("steps.txt","r")

    try:
        # use num_month if/elif to indicate number of days in each month
        for num_month in range(1, 13):
            if ((num_month == 1) or (num_month == 3) or (num_month == 5)
                or (num_month == 7) or (num_month == 8)
                or (num_month == 10) or (num_month == 12)):
                num_days = 31
            elif (num_month == 2):
                num_days = 28
            elif ((num_month == 4) or (num_month == 6)
                  or (num_month == 9) or (num_month == 11)):
                num_days = 30

            # start accumulators
            count = 0
            total = 0

            # use while loop to read file to get the step counts
            # for each day and add those to the accumulator 
            while count < num_days:
                num_steps = int(steps_file.readline())
                total += num_steps
                
                # increase the count to continue the loop
                count += 1
            
            # calculate and print average (again outside of while loop!)
            avg = total / num_days
            print("The average number of steps taken for month",
                  num_month, "is", format(avg, ".2f"))

        # close file
        steps_file.close()

    # print error messages for IO/Value exceptions
    except IOError:
        print("An error occured trying to read the file.")   
    except ValueError:
        print("Non-numeric data found in the file.")
    except:
        print("An error occured.")

# call main function
main()
