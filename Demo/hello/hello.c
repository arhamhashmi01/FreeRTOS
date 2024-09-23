#include "FreeRTOS.h"
#include "task.h"
#include <stdio.h>

// Task function that prints "Hello World"
void vTaskHelloWorld(void *pvParameters)
{
    // Suppress unused parameter warning
    (void) pvParameters;
    
    // Infinite loop
    for(;;)
    {
        // Print "Hello World"
        printf("Hello World\n");

        // Delay for 1000ms (1 second)
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
}

// Hook function to handle stack overflow
void vApplicationStackOverflowHook(TaskHandle_t xTask, char *pcTaskName)
{
    // Handle the stack overflow (for now, just print and stop)
    printf("Stack Overflow in task: %s\n", pcTaskName);
    for(;;);  // Infinite loop to halt the system
}

// Hook function to handle malloc failures
void vApplicationMallocFailedHook(void)
{
    // Handle memory allocation failure (for now, just print and stop)
    printf("Memory allocation failed!\n");
    for(;;);  // Infinite loop to halt the system
}

int main(void)
{
    // Create the Hello World task
    xTaskCreate(
        vTaskHelloWorld,         // Task function
        "HelloWorldTask",        // Task name
        configMINIMAL_STACK_SIZE, // Stack size
        NULL,                    // Task parameters
        1,                       // Priority
        NULL                     // Task handle (optional)
    );

    // Start the scheduler
    vTaskStartScheduler();

    // If the scheduler starts successfully, the program should never reach here
    for(;;);  // Infinite loop as fallback
    
    return 0;
}
