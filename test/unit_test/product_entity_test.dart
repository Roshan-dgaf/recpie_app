import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/feature/Product/domain/entity/product_entity.dart';

void main() {
  group('ProductEntity', () {
    test('should support value equality', () {
      const product1 = ProductEntity(
        productId: '123',
        productName: 'ButterChicken',
        image: 'butter.jpg',
        description: 'A pair of running shoes',
        type: 'Footwear',
        quantity: '10',
        price: '100',
      );
      const product2 = ProductEntity(
        productId: '123',
        productName: 'ButterChicken',
        image: 'butter.jpg',
        description: 'A pair of running shoes',
        type: 'Footwear',
        quantity: '10',
        price: '100',
      );
      expect(product1, equals(product2));
    });

    test('should allow nullable productId', () {
      const product = ProductEntity(
        productId: null,
        productName: 'ButterChicken',
        image: 'butter.jpg',
        description: 'A pair of running shoes',
        type: 'Recipe',
        quantity: '10',
        price: '100',
      );
      expect(product.productId, isNull);
    });

    test(
      'should create a unique instance when different values are provided',
      () {
        const product1 = ProductEntity(
          productId: '123',
          productName: 'ButterChicken',
          image: 'butter.jpg',
          description: 'A pair of running shoes',
          type: 'Footwear',
          quantity: '10',
          price: '100',
        );
        const product2 = ProductEntity(
          productId: '124',
          productName: 'ButterChicken',
          image: 'sneakers.jpg',
          description: 'A pair of stylish sneakers',
          type: 'Footwear',
          quantity: '5',
          price: '120',
        );
        expect(product1, isNot(equals(product2)));
      },
    );

    test('should be an instance of Equatable', () {
      const product = ProductEntity(
        productId: '123',
        productName: 'Shoes',
        image: 'shoes.jpg',
        description: 'A pair of running shoes',
        type: 'Footwear',
        quantity: '10',
        price: '100',
      );
      expect(product, isA<Equatable>());
    });
  });
}
