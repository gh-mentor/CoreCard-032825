# Copilot Code Generation Instructions for C#

## General Guidelines
- Use camelCase for local variables and method parameters.
- Use PascalCase for class names, method names, and properties.
- Use double quotes for strings.
- Ensure all public methods have XML documentation comments.
- Ensure consistent indentation using 4 spaces.

## Specific Instructions
- Use `readonly` for fields that do not change after construction.
- Use `var` for local variable declarations when the type is obvious.
- Prefer expression-bodied members for simple methods and properties.
- Use string interpolation instead of string concatenation.
- Ensure all async methods handle exceptions using try-catch.
- Verify that all using directives are necessary.
- Check for proper exception handling in all methods.
- Ensure all loops have proper termination conditions.
- Use descriptive names for variables and methods.
- Avoid deeply nested code; refactor into smaller methods if necessary.
- Ensure all tasks are properly awaited.
- Verify that all dependencies are listed in the project file.
- Check for any potential performance issues.

## SOLID Principles
- Ensure that classes adhere to the Single Responsibility Principle (SRP).
- Use interfaces to support the Open/Closed Principle (OCP).
- Apply the Liskov Substitution Principle (LSP) by ensuring derived classes can be substituted for their base classes.
- Use dependency injection to follow the Dependency Inversion Principle (DIP).
- Ensure that classes depend on abstractions, not on concrete implementations.

## Example Code Snippet: SOLID Principles

```csharp
public interface IShape
{
	double Area();
}

public class Rectangle : IShape
{
	public double Width { get; set; }
	public double Height { get; set; }
	public double Area() => Width * Height;
}	

public class Circle : IShape
{
	public double Radius { get; set; }
	public double Area() => Math.PI * Radius * Radius;
}

public class AreaCalculator
{
	public double CalculateArea(IShape shape) => shape.Area();
}

public class MainClass
{
	public static void Main()
	{
		IShape rectangle = new Rectangle { Width = 5, Height = 10 };
		IShape circle = new Circle { Radius = 7 };
		
		AreaCalculator calculator = new AreaCalculator();
		Console.WriteLine($"Area of Rectangle: {calculator.CalculateArea(rectangle)}");
		Console.WriteLine($"Area of Circle: {calculator.CalculateArea(circle)}");
	}
}
```


## Testing with NUnit
- Ensure all test methods are decorated with the `[Test]` attribute.
- Use `[SetUp]` and `[TearDown]` attributes for initializing and cleaning up resources.
- Use `Assert` class for verifying test outcomes.

## Example Code Snippet: NUnit Tests
```csharp
using NUnit.Framework;

[TestFixture]
public class CalculatorTests
{
	private Calculator calculator;
	[SetUp]
	public void Setup()
	{
		calculator = new Calculator();
	}
	[Test]
	public void Add_WhenCalled_ReturnsSumOfArguments()
	{
		Assert.AreEqual(5, calculator.Add(2, 3));
	}
	[TearDown]
	public void Cleanup()
	{
		calculator = null;
	}
}
	
```


