program main
    implicit none
    
    integer :: i
    integer :: j
    integer, dimension(100) :: list, orig_list
    integer :: start_count, end_count, count_rate
    integer(8) :: total_duration_ns
    real(8) :: avg_time_ms

    interface
        subroutine sort(lst)
            integer, dimension(:), intent(inout) :: lst
        end subroutine sort
    end interface

    do i = 1, 100
        orig_list(i) = 101 - i
    end do

    call system_clock(count_rate = count_rate)
    call system_clock(start_count)

    do i = 1, 100
        list = orig_list
        call sort(list)
    end do

    call system_clock(end_count)

    total_duration_ns = int((real(end_count - start_count, 8) / count_rate) * 1.0e9)
    avg_time_ms = real(total_duration_ns, 8) / 100.0d0 / 1.0e6

    print *, "Total time for 100 runs: ", total_duration_ns, " ns"
    print *, "Average time per function call: ", avg_time_ms, " ms"

end program main

subroutine sort(lst)
    implicit none
    integer, dimension(:), intent(inout) :: lst
    integer :: x, z, y
    x = 1
    z = 0
    
    do while (z < size(lst) - 1)
        if (x < size(lst)) then
            if (lst(x) > lst(x + 1)) then
                y = lst(x)
                lst(x) = lst(x + 1)
                lst(x + 1) = y
                z = 0
            else
                z = z + 1
            end if
            x = x + 1
        else
            x = 1
            z = 0
        end if
    end do
end subroutine sort
