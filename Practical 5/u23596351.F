


      PROGRAM STATS
      IMPLICIT NONE

      REAL    :: arr(5)
      REAL    :: mode, mean, median
      REAL, EXTERNAL :: findMode, findMean, findMedian

      CALL readData(arr)

      mode   = findMode(arr)
      mean   = findMean(arr)
      median = findMedian(arr)

      WRITE(*,*) 'Mode   : ', mode
      WRITE(*,*) 'Mean   : ', mean
      WRITE(*,*) 'Median : ', median

      END PROGRAM STATS

C     asks for 5 inputs of float vals
C     populates arr by reference (INTENT(INOUT)).
      SUBROUTINE readData(arr)
      IMPLICIT NONE
      REAL, INTENT(INOUT) :: arr(5)
      INTEGER :: i

      WRITE(*,*) 'Enter 5 floating-point values:'
      DO i = 1, 5
        WRITE(*,'(A,I1,A)', ADVANCE='NO') 'Value ', i, ': '
        READ(*,*) arr(i)
      END DO

      END SUBROUTINE readData

C     Returns the most frequently occurring value in arr.
      REAL FUNCTION findMode(arr)
      IMPLICIT NONE
      REAL, INTENT(IN) :: arr(5)
      INTEGER :: i, j, count, maxCount
      REAL    :: modeVal

      maxCount = 0
      modeVal  = arr(1)

      DO i = 1, 5
        count = 0
        DO j = 1, 5
          IF (arr(j) .EQ. arr(i)) THEN
            count = count + 1
          END IF
        END DO
        IF (count .GT. maxCount) THEN
          maxCount = count
          modeVal  = arr(i)
        END IF
      END DO

      findMode = modeVal

      END FUNCTION findMode

C     Returns the arithmetic mean of the values in arr.
      REAL FUNCTION findMean(arr)
      IMPLICIT NONE
      REAL, INTENT(IN) :: arr(5)
      REAL    :: total
      INTEGER :: i

      total = 0.0
      DO i = 1, 5
        total = total + arr(i)
      END DO

      findMean = total / 5.0

      END FUNCTION findMean

C     Returns median
      REAL FUNCTION findMedian(arr)
      IMPLICIT NONE
      REAL, INTENT(IN) :: arr(5)
      REAL    :: sorted(5), temp
      INTEGER :: i, j

C     Copy arr into local sorted array
      DO i = 1, 5
        sorted(i) = arr(i)
      END DO

C     Bubble sort (ascending)
      DO i = 1, 4
        DO j = 1, 5 - i
          IF (sorted(j) .GT. sorted(j + 1)) THEN
            temp         = sorted(j)
            sorted(j)     = sorted(j + 1)
            sorted(j + 1) = temp
          END IF
        END DO
      END DO

C     Median is the middle element (index 3 of 5)
      findMedian = sorted(3)

      END FUNCTION findMedian